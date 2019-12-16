#!/bin/bash
# Simple inspector for Docker container IP address
# Thanks for Steven

webhost="$1.docker"
container="$1-web-server"

nginx="$1.nginx"
nginx_container="$1-nginx"

dbhost="$1.database"
dbcontainer="$1-database"

if [ $# -ne 1 ]; then
    echo -e "Please set the project key of web server as argument!\n"
    exit 255
fi

ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container)
sudo sed -i /$webhost/d /etc/hosts
echo "$ip $webhost" | sudo tee -a /etc/hosts

ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $nginx_container)
sudo sed -i /$nginx/d /etc/hosts
echo "$ip $nginx" | sudo tee -a /etc/hosts

dbip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dbcontainer)
sudo sed -i /$dbhost/d /etc/hosts
echo "$dbip $dbhost" | sudo tee -a /etc/hosts

exit 0
