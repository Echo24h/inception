#!/bin/bash

# Charger les variables d'environnement depuis le fichier .env
if [ -f .env ]; then
    source .env
fi

# Chemin du dossier principal
main_path="/home/$USER/inception"

# Vérifier si le dossier principal existe déjà
if [ -d "$main_path" ]; then
    echo "Le dossier $main_path existe déjà."
else
    # Créer le dossier s'il n'existe pas
    mkdir -p "$main_path"
    chmod 777 "$main_path"
    echo "Le dossier $main_path a été créé avec succès."
fi

# Chemin du sous-dossier mariadb
mariadb_path="$main_path/mariadb"
# Chemin du sous-dossier wordpress
wordpress_path="$main_path/wordpress"

# Vérifier si le dossier mariadb existe déjà
if [ -d "$mariadb_path" ]; then
    echo "Le dossier $mariadb_path existe déjà."
else
    # Créer le dossier s'il n'existe pas
    mkdir -p "$mariadb_path"
    chmod 777 "$mariadb_path"
    echo "Le dossier $mariadb_path a été créé avec succès."
fi

# Vérifier si le dossier wordpress existe déjà
if [ -d "$wordpress_path" ]; then
    echo "Le dossier $wordpress_path existe déjà."
else
    # Créer le dossier s'il n'existe pas
    mkdir -p "$wordpress_path"
    chmod 777 "$wordpress_path"
    echo "Le dossier $wordpress_path a été créé avec succès."
fi