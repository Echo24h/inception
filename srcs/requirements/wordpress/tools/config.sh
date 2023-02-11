#!/bin/bash

# On attend le démarrage de la base de donnée (par sécuritée)
sleep 10

FILE=/etc/resolv.conf
if [ -f "$FILE" ]; then
	echo "$FILE exists."
else
	echo "$FILE does not exist."
	wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
fi
