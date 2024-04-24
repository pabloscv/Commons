#!/bin/bash
clear
sudo rm -rf /etc/systemd/system/ServerRecoveryAdvanced.service
sudo rm -rf /etc/systemd/system/AuthorizationLinux.service
sudo rm -rf /etc/systemd/system/FileServerLinux.service
echo -e "\e[32m Atualizando o sistema \e[0m"
sudo apt-get -y update
sudo apt -y full-upgrade
sudo apt -y autoremove
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y update
sudo apt-get -y net-tools
sudo apt-get -y libgdiplus
clear
echo -e "\e[32m Instalando Fontes do Captcha \e[0m"
sudo apt install ttf-mscorefonts-installer
clear
echo -e "\e[32m Instalando Apache2 \e[0m"
sudo apt-get -y install apache2
sudo a2enmod headers
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_balancer
sudo a2enmod proxy_http
sudo a2enmod http2
sudo a2enmod rewrite
echo -e "\e[32m Instalando ASP.NET Core 7 \e[0m"
sudo apt-get install -y apt-transport-https
sudo apt-get install -y dotnet-sdk-7.0
sudo dotnet dev-certs https --clean
sudo dotnet dev-certs https --trust
echo -e "\e[32m Instalando REDIS \e[0m"
sudo apt-get -y install redis
echo -e "\e[32m Instalando POSTGRES \e[0m"
sudo apt-get -y install postgresql
echo -e "\e[32m Instalando SSMTP \e[0m"
sudo apt-get -y install ssmtp
sudo rm -rf /etc/ssmtp/ssmtp.conf
sudo cp ./ssmtp.conf /etc/ssmtp/
echo -e "\e[32m Instalando Serviços \e[0m"
sudo cp ./Configs/LinuxServices/ServerRecoveryAdvanced.service /etc/systemd/system/
sudo cp ./Configs/LinuxServices/AuthorizationLinux.service /etc/systemd/system/
sudo cp ./Configs/LinuxServices/FileServerLinux.service /etc/systemd/system/
echo -e "\e[32m Registrando Serviços \e[0m"
sudo systemctl enable ServerRecoveryAdvanced.service
sudo systemctl enable AuthorizationLinux.service
sudo systemctl enable FileServerLinux.service
echo -e "\e[32m Configurando o Apache2 \e[0m"
sudo a2dissite 000-default.conf
sudo rm -rf /etc/apache2/sites-available
sudo cp -r ./Configs/Apache2 /etc/apache2/sites-available
sudo rm -rf /etc/apache2/apache2.conf
sudo rm -rf /etc/apache2/ports.conf
sudo cp ./Configs/Apache2Config/apache2.conf /etc/apache2
sudo cp ./Configs/Apache2Config/ports.conf /etc/apache2
sudo a2ensite ProxyReverse.conf
sudo a2ensite FileReverse.conf
sudo a2ensite FrontEnd.conf
sudo service apache2 restart
echo -e "\e[32m Instalação concluída \e[0m"
echo ""
