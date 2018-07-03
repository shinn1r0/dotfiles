sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/nginx-mainline
sudo service apache2 stop
sudo apt install php7.1 php7.1-mysql php7.1-cli php7.1-fpm nginx mysql-server composer

# phalcon-php
curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | sudo bash
sudo apt install php-phalcon
