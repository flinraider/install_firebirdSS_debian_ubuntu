#!/usr/bin/env bash

############################################
#Autor: Leonardo Teixeira                  #
#Server: Servidor firebird Super Server    #
#Version: firebird 2.1.7 x64               #
############################################

echo "install dependendcias"
apt install libstdc++5 libncurses5 wget -y

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

echo "fim"
