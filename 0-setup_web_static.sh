#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of static web contents

sudo apt-get update

sudo apt-get -y install nginx

sudo mkdir -p /data/web_static/releases/test

sudo mkdir -p /data/web_static/shared/

echo "Some Static Stuff!" | tee -a /data/web_static/releases/test/index.html

sudo ln -s -f  /data/web_static/releases/test /data/web_static/current

sudo chown ubuntu:ubuntu  /data/ -R

string="server_name _;\n\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t\ttry_files \$uri \$uri/ =404;\n\t}"

sudo sed -i "s?server_name _;?$string?" /etc/nginx/sites-enabled/default*

sudo service nginx restart

