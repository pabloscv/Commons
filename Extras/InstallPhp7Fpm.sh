#!/bin/bash
clear
echo -e "\e[32m Atualizando o sistema \e[0m"
sudo apt full-upgrade
echo -e "\e[32m Instalando apontadores \e[0m"
sudo apt -y install software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
echo -e "\e[32m Atualizando o sistema \e[0m"
sudo apt full-upgrade
echo -e "\e[32m Instalando php7.4-fpm \e[0m"
sudo apt -y install php7.4-fpm
echo -e "\e[32m Configurando php7.4-fpm \e[0m"
sudo rm -rf /etc/php/7.4/fpm/pool.d/www.conf
sudo cp ../Configs/php74-www.conf /etc/php/7.4/fpm/pool.d/www.conf
echo -e "\e[32m Configurando Apache2 \e[0m"
sudo apt install libapache2-mod-fcgid
sudo a2enmod proxy
sudo a2enmod proxy_fcgi
sudo a2dismod mpm_prefork
sudo a2enmod mpm_event
sudo service apache2 restart
echo -e "\e[32m Atualizando o sistema \e[0m"
sudo apt full-upgrade
sudo apt autoremove
echo -e "\e[32m Instalação concluída \e[0m"
echo ""