#!/bin/bash
# Indique que ce fichier doit être exécuté avec bash

# On stocke le chemin du dossier du site dans une variable
DOSSIER="$HOME/serveur/site-equipe"

# On vérifie si le dossier n'existe PAS (le ! veut dire "non")
if [ ! -d "$DOSSIER" ]; then
  # Message d'erreur si le dossier est introuvable
  echo "Erreur : le dossier $DOSSIER n'existe pas."
  # On arrête le script (le code 1 signale une erreur)
  exit 1
# Fin du if
fi

# On se place dans le dossier du site (si ça échoue, on arrête le script)
cd "$DOSSIER" || exit 1

# On récupère les dernières modifications depuis GitHub
git pull

# On copie index.html et style.css dans le dossier servi par nginx
sudo cp index.html style.css /var/www/html/

# Message de fin pour dire que tout s'est bien passé
echo "Déploiement terminé"
