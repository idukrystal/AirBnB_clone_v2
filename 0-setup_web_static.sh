#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of static web contents

sudo apt-get update

sudo apt-get -y install nginx

sudo mkdir -p /data/web_static/releases/test

sudo mkdir -p /data/web_static/shared/

echo "Some Static Stuff!" | sudo tee -a /data/web_static/releases/test/index.html

sudo ln -s -f  /data/web_static/releases/test/ /data/web_static/current

sudo chown ubuntu:ubuntu  /data/ -R

sudo sed -i "s/server_name _;/server_name crysart.tech www.crysart.tech;/" /etc/nginx/sites-available/default*

string="server_name crysart.tech www.crysart.tech;\n\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/index.html;\n\t\tlocation /hbnb_static/ {\t\t\t\n\t\t\talias /data/web_static/current/;\n\t\t\ttry_files \$uri \$uri/ =404;\n\t\t}\n\t}"

sudo sed -i "s?server_name crysart.tech www.crysart.tech;?$string?" /etc/nginx/sites-available/default*

sudo service nginx restart

