#!/bin/bash

mkdir -p /run/php
if [ ! -f "/var/www/wordpress/index.php" ]; then

	wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www > /dev/null 2>&1 
	cd /var/www && tar -xzf wordpress-6.1.1-fr_FR.tar.gz && rm wordpress-6.1.1-fr_FR.tar.gz > /dev/null 2>&1
	chown -R root:root /var/www/wordpress

fi

# On attend le démarrage de la base de donnée (par sécuritée)
sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
					    --path='/var/www/wordpress'

	wp core install		--url=localhost \
						--title="wordpress" \
						--admin_user=$WP_ADMIN_USER \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_EMAIL \
						--skip-email \
						--allow-root \
						--path='/var/www/wordpress'

	wp user create		$WP_USER $WP_EMAIL \
						--user_pass=$WP_PASSWORD \
	       				--allow-root \
						--path='/var/www/wordpress' \
						--url=localhost

fi

/usr/sbin/php-fpm7.3 -F