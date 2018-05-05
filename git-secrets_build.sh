## git-secrets
git clone https://github.com/awslabs/git-secrets.git
cd git-secrets/ && make install && cd ../ && rm -r git-secrets
git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templatedir '~/.git-templates/git-secrets'
