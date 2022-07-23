#!/bin/bash
clear
echo "Atualizando o sistema"
sudo apt-get -y update
sudo apt -y full-upgrade
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y update
echo "Instalando ASP.NET Core 6"
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get -y update
sudo apt-get install -y apt-transport-https
sudo apt-get -y update
sudo apt-get install -y dotnet-sdk-6.0
sudo dotnet dev-certs https --trust
echo "Instalando REDIS"
sudo apt-get -y install redis
echo "Instalando POSTGRES"
sudo apt-get -y install postgresql
echo "Instalando SSMTP"
sudo apt-get -y install ssmtp
sudo rm -rf /etc/ssmtp/ssmtp.conf
sudo cp ./ssmtp.conf /etc/ssmtp/
echo "Instalando Serviços"
sudo cp ./ServerRecoveryLinux/ServerRecoveryLinux.service /etc/systemd/system/
sudo cp ./AuthorizationLinux/AuthorizationLinux.service /etc/systemd/system/
sudo cp ./SettingsDriverLinux/SettingsDriverLinux.service /etc/systemd/system/
sudo cp ./SettingsWebInterfaceLinux/SettingsWebInterfaceLinux.service /etc/systemd/system/
echo "Registrando Serviços"
sudo systemctl enable ServerRecoveryLinux.service
sudo systemctl enable AuthorizationLinux.service
sudo systemctl enable SettingsDriverLinux.service
sudo systemctl enable SettingsWebInterfaceLinux.service
echo "Iniciando Serviços"
sudo service SettingsWebInterfaceLinux start
sudo service SettingsDriverLinux start
sudo service ServerRecoveryLinux start
sudo service SettingsWebInterfaceLinux start
echo "Instalando Apache2"
sudo apt-get -y install apache2
sudo service apache2 stop
sudo a2enmod headers
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_balancer
sudo a2enmod proxy_http
sudo a2enmod http2
sudo a2dissite 000-default.conf
sudo cp ./ProxyReverse.conf /etc/apache2/sites-available/
sudo a2ensite ProxyReverse.conf
sudo service apache2 start
sudo service apache2 status

