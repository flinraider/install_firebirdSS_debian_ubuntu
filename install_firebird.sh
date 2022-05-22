#!/usr/bin/env bash

############################################
#Autor: Leonardo Teixeira                  #
#Server: Servidor firebird Super Server    #
#Version: firebird 2.1.7 x64               #
#Ubuntu 18-server ou debian 9              #
#kernel 4.15.0-156-generic                 #
############################################

echo "atualizando o sistema"
sudo apt update && upgrade -y

echo "install dependendcias"
sudo apt install libstdc++5 libncurses5 wget -y

sleep 5

echo "movendo para opt firebird 2.1.7"
mv FirebirdSS-2.1.7.18553-0.amd64.tar.gz /opt/

echo "trocando de diretorio"
cd /opt/

echo "descompactando aqruivo"
tar -xvf /opt/FirebirdSS-2.1.7.18553-0.amd64.tar.gz

echo "renomeando diretorio firebird"
mv FirebirdSS-2.1.7.18553-0.amd64 firebird.ss

echo "mudando a proprieda do diretorio e arquivos"
chown $USER:$USER -R firebird.ss/

echo "entrando no diretorio firebird"
cd firebird.ss/

echo "instalando servidor"
./install.sh

echo "habilitando e liberando protocolos no firewall UFW"
sudo ufw enable         # habilitando
sudo ufw allow 22/tcp   # conexao ssh
sudo ufw allow 3050/tcp # porta padrao firebird conexao em rede

echo "start service"
service firebird start
service firebird status

echo "fim"
echo "para encerar o serviço"
echo "service firebid stop"

