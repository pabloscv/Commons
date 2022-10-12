#!/bin/bash
clear
echo -e "\e[32m Atualizando o sistema \e[0m"
sudo rm -rf /etc/systemd/system/ServerRecoveryLinux.service
sudo rm -rf /etc/systemd/system/AuthorizationLinux.service
sudo rm -rf /etc/systemd/system/SettingsDriverLinux.service
sudo rm -rf /etc/systemd/system/SettingsWebInterfaceLinux.service
sudo apt-get -y update
sudo apt -y full-upgrade
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y update
sudo apt-get autoremove
sudo apt autoremove
clear
echo -e "\e[32m Instalando ASP.NET Core 6 \e[0m"
sudo apt-get install -y apt-transport-https
sudo apt-get -y update
sudo apt-get install -y dotnet-sdk-6.0
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
sudo cp ./LinuxServices/ServerRecoveryLinux.service /etc/systemd/system/
sudo cp ./LinuxServices/AuthorizationLinux.service /etc/systemd/system/
sudo cp ./LinuxServices/SettingsDriverLinux.service /etc/systemd/system/
sudo cp ./LinuxServices/SettingsWebInterfaceLinux.service /etc/systemd/system/
echo -e "\e[32m Registrando Serviços \e[0m"
sudo systemctl enable ServerRecoveryLinux.service
sudo systemctl enable AuthorizationLinux.service
sudo systemctl enable SettingsDriverLinux.service
sudo systemctl enable SettingsWebInterfaceLinux.service
echo -e "\e[32m Iniciando Serviços \e[0m"
sudo service SettingsWebInterfaceLinux start
sudo service SettingsDriverLinux start
sudo service ServerRecoveryLinux start
sudo service AuthorizationLinux start
echo -e "\e[32m Instalando Apache2 \e[0m"
sudo apt-get -y install apache2
sudo a2enmod headers
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_balancer
sudo a2enmod proxy_http
sudo a2enmod http2
sudo a2dissite 000-default.conf
sudo cp ./ProxyReverse.conf /etc/apache2/sites-available/
sudo a2ensite ProxyReverse.conf
sudo service apache2 restart
echo -e "\e[32m Instalação concluída \e[0m"
sudo cp ./iplocal.sh /root/iplocal.sh
sudo cp ./redis28.conf /root/redis28.conf
sudo chmod a+x /root/iplocal.sh
echo ""
echo -e "\e[32m ** Lembre-se de terminar a configuração do arquivo /etc/ssmtp/ssmtp.conf \e[0m"
echo ""
