#!/bin/zsh

if (! type conda &> /dev/null); then
    if (! type anyenv &> /dev/null); then
        $DOTPATH/env/anyenv.sh
    fi
    if (! type pyenv &> /dev/null); then
        anyenv install pyenv
        exec $SHELL -l
    fi

    # python install
    VERSION=$(pyenv install -l | grep -E "^  anaconda3.*$" | sort -V | tail -n 1 | awk '{print $1}')
    pyenv install ${VERSION}
    pyenv global ${VERSION}
    pyenv rehash
    # requirements
    pip install --upgrade pip setuptools pipenv Pygments pynvim neovim-remote pytest flake8 mypy pylint jedi ninja awscli
    DOTPATH=$HOME/.dotfiles
    ln -snfv $DOTPATH/env/flake8 $HOME/.config/flake8

    conda install -y python=3.7.3
    conda install -y -c conda-forge awscli
    conda install -y pytorch-cpu torchvision-cpu -c pytorch
fi

# pip install
pip install ipyparallel jupyter jupyterlab jupyter-contrib-nbextensions jupyter-nbextensions-configurator jupyterthemes
pip install isort autopep8
pip install ipywidgets ipympl nbdime
pip install jupyterlab_code_formatter jupyterlab-git jupyterlab_templates jupyterlab_code_formatter jupyterlab_latex

# jupyter notebook settings
ipython profile create
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
mkdir -p $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding
jupyter nbextension enable vim_binding/vim_binding
jt -t onedork -vim -T -N -ofs 11 -f hack -tfs 11 -cellw 95%
cat ${HOME}/.ipython/profile_default/ipython_config.py | sed -e "s/#c.InteractiveShellApp.exec_lines = \[\]/c.InteractiveShellApp.exec_lines = \['%matplotlib widget'\]/g" | tee ${HOME}/.ipython/profile_default/ipython_config.py

# jupyter notebook extension
ipcluster nbextension enable
jupyter nbextension enable toggle_all_line_numbers/main
jupyter nbextension enable code_prettify/code_prettify
jupyter nbextension enable code_prettify/isort
jupyter nbextension enable code_prettify/autopep8
jupyter nbextension enable livemdpreview/livemdpreview
jupyter nbextension enable codefolding/main
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension disable hinterland/hinterland
jupyter nbextension enable toc2/main
jupyter nbextension enable varInspector/main
jupyter nbextension enable ruler/main
jupyter nbextension enable latex_envs/latex_envs
jupyter nbextension enable comment-uncomment/main
jupyter nbextension enable scratchpad/main
jupyter nbextension enable gist_it/main
jupyter nbextension enable keyboard_shortcut_editor/main
jupyter nbextension enable hide_input/main
jupyter nbextension enable hide_input_all/main
jupyter nbextension enable table_beautifier/main
jupyter nbextension enable equation-numbering/main
jupyter nbextension enable highlight_selected_word/main
jupyter nbextension enable freeze/main
jupyter nbextension enable snippets/main
jupyter nbextension enable snippets_menu/main
jupyter nbextension enable vim_binding/vim_binding

# jupyterlab extension
jupyter labextension install jupyterlab_vim
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install @jupyterlab/toc
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter labextension install jupyterlab_tensorboard
jupyter labextension install @jupyterlab/git
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter labextension install jupyterlab_voyager
jupyter labextension install @krassowski/jupyterlab_go_to_definition
jupyter labextension install jupyterlab_templates
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter labextension install @jupyterlab/katex-extension
jupyter labextension install @jupyterlab/latex
jupyter labextension install jupyterlab-drawio

# jupyter server extension
jupyter serverextension enable --py jupyterlab_code_formatter
jupyter serverextension enable --py jupyterlab_git
jupyter serverextension enable --py jupyterlab_templates
jupyter serverextension enable --py jupyterlab_code_formatter
jupyter serverextension enable --py nbdime --sys-prefix

# jupyter server extension
mkdir -p ~/jupyter
mkdir -p ~/jupyter/templates