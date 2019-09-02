#!/bin/zsh

python_version="3.7.3"
cica_version="v5.0.1"

if (! type conda &> /dev/null); then
    if (! type anyenv &> /dev/null); then
        $DOTPATH/env/anyenv.sh
    fi
    if (! type pyenv &> /dev/null); then
        anyenv install pyenv
        exec $SHELL -l
    fi
    if (! type nodenv &> /dev/null); then
        anyenv install nodenv
        exec $SHELL -l
    fi

    # python install
    pyenv install miniconda3-latest
    pyenv global miniconda3-latest
    pyenv rehash
    # requirements
    DOTPATH=$HOME/.dotfiles
    ln -snfv $DOTPATH/env/flake8 $HOME/.config/flake8
fi

# conda install
conda config --append channels conda-forge
conda config --add channels pytorch
conda install -y python=${python_version} \
awscli pynvim pytest Pygments \
numpy scipy numba pandas dask matplotlib numexpr \
scikit-learn scikit-image bokeh pillow accimage pyspark xlrd sympy altair \
ipython ipyparallel ipywidgets ipympl \
jupyter jupyterlab nbdime nbconvert nbformat \
beautifulsoup4 lxml jinja2 sphinx \
isort pep8 autopep8 flake8 pyflakes pylint jedi tqdm \
tensorboard pytorch torchvision cudatoolkit=10.0
conda update --all -y
conda clean --all
# pip install
pip install -U pip setuptools pipenv kaggle \
jupyterlab_code_formatter jupyterlab-git jupyterlab_templates jupyterlab_latex jupyter-tensorboard
rm -rf ${HOME}/.cache/pip

# jupyter font settings
sudo apt-get install curl unzip -y
sudo mkdir -p /usr/share/fonts/opentype/noto
curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip
sudo unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/opentype/noto
rm NotoSansCJKjp-hinted.zip
sudo mkdir -p /usr/share/fonts/opentype/cica
curl -LO https://github.com/miiton/Cica/releases/download/${cica_version}/Cica_${cica_version}_with_emoji.zip
sudo unzip Cica_${cica_version}_with_emoji.zip -d /usr/share/fonts/opentype/cica
sudo rm Cica_${cica_version}_with_emoji.zip
sudo apt-get install fontconfig
sudo fc-cache -f
echo "\nfont.family: Noto Sans CJK JP" >> $(python -c 'import matplotlib as m; print(m.matplotlib_fname())') && rm -f ~/.cache/matplotlib/font*

# jupyter settings
ipython profile create
cat ${HOME}/.ipython/profile_default/ipython_config.py | sed -e "s/#c.InteractiveShellApp.exec_lines = \[\]/c.InteractiveShellApp.exec_lines = \['%matplotlib widget'\]/g" | tee ${HOME}/.ipython/profile_default/ipython_config.py

# jupyterlab extension
jupyter labextension install jupyterlab_vim
jupyter labextension install @jupyterlab/git
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install @krassowski/jupyterlab_go_to_definition
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib
#jupyter labextension install jupyterlab_voyager
jupyter labextension install @jupyterlab/toc
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter labextension install jupyterlab_tensorboard
jupyter labextension install jupyterlab_templates
jupyter labextension install @jupyterlab/latex
jupyter labextension install @jupyterlab/katex-extension
jupyter labextension install jupyterlab-drawio
jupyter serverextension enable --py jupyterlab_git
jupyter serverextension enable --py jupyterlab_code_formatter
jupyter serverextension enable --py jupyterlab_templates
nbdime extensions --enable

# jupyter server extension
mkdir -p ~/jupyter
mkdir -p ~/jupyter/templates
