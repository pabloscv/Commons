#!/bin/bash
echo -e "\e[32m Reiniciando os serviços \e[0m"
sudo service ServerRecoveryLinux stop
sudo service AuthorizationLinux stop
sudo service SettingsDriverLinux stop
sudo service SettingsWebInterfaceLinux stop
sudo service FileServerLinux stop
sudo service SettingsDriverLinux start
sudo service ServerRecoveryLinux start
sudo service AuthorizationLinux start
sudo service SettingsWebInterfaceLinux start
sudo service FileServerLinux start
echo ""
echo "Serviços reiniciados!!"