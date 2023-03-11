#!/bin/bash
echo -e "\e[32m Reiniciando os serviços \e[0m"
echo -e "\e[32m ServerRecoveryLinux \e[0m"
sudo service ServerRecoveryLinux restart
echo -e "\e[32m AuthorizationLinux \e[0m"
sudo service AuthorizationLinux restart
echo -e "\e[32m SettingsDriverLinux \e[0m"
sudo service SettingsDriverLinux restart
echo -e "\e[32m SettingsWebInterfaceLinux \e[0m"
sudo service SettingsWebInterfaceLinux restart
echo -e "\e[32m FileServerLinux \e[0m"
sudo service FileServerLinux restart
echo ""
echo -e "\e[32m Serviços reiniciados \e[0m"
echo ""