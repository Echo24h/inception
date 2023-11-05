# Virtualisation de plusieurs images Docker dans une machine virtuelle

/!\ L'utilisation de ce projet nécessite de créer un fichier `srcs/.env`, contenant vos variables environnementales suivantes :

```bash
DOMAIN_NAME= ...
MYSQL_DATABASE= ...
MYSQL_ROOT_PASSWORD= ...
MYSQL_USER= ...
MYSQL_PASSWORD= ...
```

Ce projet vise à approfondir les connaissances en administration système en utilisant Docker pour virtualiser plusieurs images dans une machine virtuelle. Les commandes suivantes sont disponibles pour construire, exécuter et nettoyer les images :

* `make`: Créer le projet
*(le fichier init.sh créé le chemin `/home/$USER/inception` pour les volumes docker `mariadb` et `wordpress`)*

* `make fclean`: Supprime tous les fichiers générés lors de la compilation ainsi que les images Docker et les conteneurs

Pour naviguer dans les dockers :

* `docker logs -it [docker_name]`: Ouvre les fichiers du docker

<p align="center">
<img height="500" src="https://github.com/Echo24h/inception/blob/main/schema_inception.png" alt="Schema du réseau Inception">
</p>

Pour plus d'informations sur Docker, vous pouvez consulter la documentation officielle : https://docs.docker.com/reference/.

Le projet utilise également NGINX comme serveur web. Pour plus d'informations sur NGINX, vous pouvez consulter la documentation officielle : https://nginx.org/en/docs/.

Le projet intègre également la version 6.1.1 de WordPress comme plateforme de blog. Pour plus d'informations sur l'utilisation de WordPress, vous pouvez consulter la documentation officielle : https://fr.wordpress.org/support/.

Un tutoriel pour utiliser le projet "inception" est également disponible à l'adresse suivante : https://tuto.grademe.fr/inception/.

