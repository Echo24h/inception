#!/bin/bash

# Générer un certificat SSL auto-signé
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "${SSL_CERTIFICAT}"

# Exécutez Nginx en arrière-plan
nginx -g "daemon off;"