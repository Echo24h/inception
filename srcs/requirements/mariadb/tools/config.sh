#!/bin/bash

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then

    service mysql start

    # On créé la database
    mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"

    # On créé l'utilisateur
    mysql -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"

    # On donne les droits à l'utilisateur
    mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    #mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

    # On actualise les privilèges
    mysql -e "FLUSH PRIVILEGES;"

    mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('$MYSQL_ROOT_PASSWORD');"

    # On redémarre et relance MySQL
    mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

fi

exec mysqld_safe
