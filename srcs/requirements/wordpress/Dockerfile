FROM debian:buster

# On met à jour le container
RUN apt update -y
RUN apt upgrade -y

# On install wget pour Wordpress
RUN apt-get -y install wget

# On install vim
RUN apt install vim -y

# On install PHP
RUN apt install -y php7.3 \
					php-fpm \
					php-mysql \
					mariadb-client

# On copy la config de PHP
#COPY conf/php.ini /etc/php/7.4/cli/
#COPY conf/php.ini /etc/php/7.4/fpm/

# On télécharge Wordpress
RUN wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www
# On le décompresse et supprime le zip
RUN cd /var/www && tar -xzf wordpress-6.1.1-fr_FR.tar.gz && rm wordpress-6.1.1-fr_FR.tar.gz

# On ajoute les droits
RUN chown -R root:root /var/www/wordpress

# On télécharge le CLI pour la config Wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# On donne les droits et on le déplace dans les binaires
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# On pré-config Wordpress
#COPY tools/config.sh /tmp/config.sh
#ENTRYPOINT ["sh", "/tmp/config.sh"]

# On démarre PHP
RUN mkdir -p /run/php
#RUN /usr/sbin/php-fpm7.3 -F
