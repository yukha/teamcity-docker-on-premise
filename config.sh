#!/bin/sh

SQL_SERVER_SA_PASSWORD="enter-strong-password-here"
WEB_SITE_ROOT="jurij-teamcity.northeurope.cloudapp.azure.com"

sudo mkdir -p /app/static

sudo mkdir -p /data/sql-server/backups
sudo mkdir -p /data/sql-server/data
sudo mkdir -p /data/sql-server/logs

sudo mkdir -p /data/ssl

sudo mkdir -p /data/teamcity/datadir
sudo mkdir -p /data/teamcity/logs

yes | cp -rf docker-compose-nginx.yml /app/
yes | cp -rf docker-compose-sql.yml /app/
yes | cp -rf nginx.conf /app/

sed -i "s/@@SQL_SERVER_SA_PASSWORD@@/$SQL_SERVER_SA_PASSWORD/g" /app/docker-compose-sql.yml
sed -i "s/@@WEB_SITE_ROOT@@/$WEB_SITE_ROOT/g" /app/nginx.conf

#openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
#cp -f ./server.key /data/ssl/
#cp -f ./server.crt /data/ssl/
#rm server.key server.crt
