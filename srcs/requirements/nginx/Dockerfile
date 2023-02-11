FROM debian:buster

# On met à jour le container
RUN apt update -y
RUN apt upgrade -y

# On install vim et nginx
RUN apt install nginx -y
RUN apt install vim -y

# On install les certificats SSL
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=gborne.42.fr/UID=gborne"
RUN mkdir -p /var/run/nginx

# On copy le fichier config de nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# On ajoute les droits
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# On lance nginx
CMD [ "nginx", "-g", "daemon off;" ]
