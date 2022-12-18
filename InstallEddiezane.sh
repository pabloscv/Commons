#!/bin/bash
clear
echo -e "\e[32m Atualizando o sistema \e[0m"
useradd -m eddiezane
usermod -a -G sudo eddiezane
chsh -s /bin/bash eddiezane
cp sudoers /etc