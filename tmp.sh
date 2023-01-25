string="server_name _;\n\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/\n\t\ttry_files \$uri \$uri/ =404;\n\t}"

sed -i "s?server_name _;?$string?" $1
