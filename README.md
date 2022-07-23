[![.NET](https://github.com/pabloscv/Patty-Authorization-API/actions/workflows/dotnet.yml/badge.svg)](https://github.com/pabloscv/Patty-Authorization-API/actions/workflows/dotnet.yml) [![.NET](https://github.com/pabloscv/ServerRecovery/actions/workflows/dotnet.yml/badge.svg)](https://github.com/pabloscv/ServerRecovery/actions/workflows/dotnet.yml) [![.NET](https://github.com/pabloscv/SettingsDriverCore/actions/workflows/dotnet.yml/badge.svg)](https://github.com/pabloscv/SettingsDriverCore/actions/workflows/dotnet.yml) [![.NET](https://github.com/pabloscv/SettingsDriver/actions/workflows/dotnet.yml/badge.svg)](https://github.com/pabloscv/SettingsDriver/actions/workflows/dotnet.yml)

- 👋 Olá sou Pablo Cavalcante
- 👀 Estou criando esse repositório para guardar ideias e criações
- 🌱 Atualmente estou estudando as tecnologias de dados
- 📫 Para falar comigo envie um email para pabloscv@gmail.com

#Instalação

##Instalação do Postgresql
* Mude a senha do usuário postgres. sudo passwd postgres
* Acesse o usuário. su postgres
* Volte na home. cd ~
* Acesse o cliente do postgres. psql
* Troque a senha do banco de dados. ALTER USER postgres WITH PASSWORD 'novasenha';
* Crie uma database. CREATE DATABASE basedados;
* Feche a interface cliente. Exit;
* Feche o usuário. Exit
* Caso queira acessar o banco de dados fora do servidor então configure o arquivo. pg_hba.conf, utilize IPV4, host all all 0.0.0.0/0 md5
* Caso queira acessar o banco de dados fora do servidor então configure o aqruivo. postgresql, utilize, listen_addresses = '*'

##Instalação Ubuntu 22LTS ou >
* Clone o repositório na pasta /var/publish
* Execute o comando chmod a+x InstallSVC.sh
* Execute o arquivo /var/publish/Commons/InstallSVC.sh
* Configure o arquivo /etc/ssmtp/ssmtp.conf ou se precisar utilize o modelo em /var/publish/Commons/ssmtp_modelo2.conf
* Acesse o endereço do seu site: http://site/settwebi/
* Acesse o Settings Web Interface e informe um usuário e senha. Esse usuário e senha inicial será gravado como um usuário permanente.
* Configure a aplicação do SettingsWebInterface
* Reinicie o servidor
* Acesse o endereço do seu site: http://site/authorization/configdb
* Instalado com sucesso!

Obrigado!

<!---
pabloscv/pabloscv is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
