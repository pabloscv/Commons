#!/bin/bash
echo -e "\e[32m Parando o serviço Apache2 \e[0m"
sudo service apache2 stop
echo -e "\e[32m Parando o serviço ServerRecoveryLinux \e[0m"
sudo service ServerRecoveryLinux stop
echo -e "\e[32m Parando o serviço AuthorizationLinux \e[0m"
sudo service AuthorizationLinux stop
echo -e "\e[32m Parando o serviço SettingsDriverLinux \e[0m"
sudo service SettingsDriverLinux stop
echo -e "\e[32m Parando o serviço SettingsWebInterfaceLinux \e[0m"
sudo service SettingsWebInterfaceLinux stop
echo -e "\e[32m Parando o serviço Postgresql \e[0m"
sudo service postgresql stop
echo -e "\e[32m Parando o serviço Redis \e[0m"
sudo service redis-server stop
echo -e "\e[32m Atualizando os serviços de rede \e[0m"
sudo ifconfig enp0s3 192.168.0.28 netmask 255.255.255.0
echo -e "\e[32m Atualizando o serviços Redis \e[0m"
rm -rf /etc/redis/redis.conf
cp ./redis28.conf /etc/redis/redis.conf
echo -e "\e[32m Iniciando o serviço Postgresql \e[0m"
sudo service postgresql start
echo -e "\e[32m Iniciando o serviço Redis \e[0m"
sudo service redis-server start
echo -e "\e[32m Iniciando o serviço SettingsWebInterfaceLinux \e[0m"
sudo service SettingsWebInterfaceLinux start
echo -e "\e[32m Iniciando o serviço SettingsDriverLinux \e[0m"
sudo service SettingsDriverLinux start
echo -e "\e[32m Iniciando o serviço ServerRecoveryLinux \e[0m"
sudo service ServerRecoveryLinux start
echo -e "\e[32m Iniciando o serviço AuthorizationLinux \e[0m"
sudo service AuthorizationLinux start
echo -e "\e[32m Iniciando o serviço Apache2 \e[0m"
sudo service apache2 start
echo ""
echo "Serviços atualizados!!"