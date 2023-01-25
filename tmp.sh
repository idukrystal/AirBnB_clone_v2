string="server_name crysart.tech www.crysart.tech;\n\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/index.html;\n\t\tlocation /hbnb_static/ {\t\t\t\n\t\t\talias /data/web_static/current/;\n\t\t\ttry_files \$uri \$uri/ =404;\n\t\t}\n\t}"

sed -i "s?server_name _;?$string?" $1
