FROM debian:buster

# On met à jour le container
RUN apt update -y
RUN apt upgrade -y

# On install la base de données
RUN apt-get install mariadb-server -y

# On copy le fichier de config mariadb
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# On pré-config la base de donnée
COPY tools/config.sh /tmp/config.sh

CMD ["sh", "/tmp/config.sh"]
