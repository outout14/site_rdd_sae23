# Site Remise Des Diplômes - SAE23
Réalisation du **Groupe 4** composé de : Maël, Alexis, Nikita et Lisa dans le cadre de la SAE23.

Ce site servira à la remise des diplômes de l'IUT de Saint-Malo.

## Prérequis

- PHP 8 (ou supérieur) ([https://www.php.net/](https://www.php.net/))
- Composer ([https://getcomposer.org/](https://getcomposer.org/))
- Git ([https://git-scm.com/](https://git-scm.com/))
- Serveur Web (Apache, Nginx, etc.)
- Serveur MySQL (ou MariaDB)
- Serveur SMTP (pour l'envoi des mails)

## Installation

Pour installer le projet, il faut cloner le dépôt git dans le dossier du serveur Web (Linux : ``/var/www/html/``) avec la commande suivante :

  ```bash
  cd /var/www/html/
  git clone git@github.com:outout14/site_rdd_sae23.git
  ```

Il faut ensuite installer les dépendances du projet avec la commande suivante dans le dossier du projet :

  ```bash
  composer install
  ```