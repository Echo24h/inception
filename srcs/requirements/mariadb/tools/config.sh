#!/bin/bash

service mysql start

# On créé la database
mysql -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"

# On créé l'utilisateur
mysql -e "CREATE USER IF NOT EXISTS \`$SQL_USER\`@'localhost' IDENTIFIED BY '$SQL_PASSWORD';"

# On donne les droits à l'utilisateur
mysql -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

# On actualise les privilèges
mysql -e "FLUSH PRIVILEGES;"

# On redémarre et relance MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
