FROM debian:buster

# On met à jour le container
RUN apt update -y
RUN apt upgrade -y

# On install wget pour Wordpress
RUN apt-get -y install wget

# On install PHP et MariaDB Client
RUN apt install -y \
	php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client;

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
        chmod +x wp-cli.phar; \
        mv wp-cli.phar /usr/local/bin/wp

COPY    conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY    tools/config.sh /tmp/config.sh

CMD ["sh", "/tmp/config.sh"]