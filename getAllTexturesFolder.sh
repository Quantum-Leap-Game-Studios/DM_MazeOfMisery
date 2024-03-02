#!/bin/bash

# Le dossier cible où tous les fichiers seront copiés
destination="AllTextures"

# Créer le dossier de destination s'il n'existe pas
mkdir -p "$destination"

# Remplir le dossier
files=`find . -type f -path "*/Textures/*"`
for file in $files; do

    # Extraction du chemin relatif et du nom du fichier
    chemin_relatif=$(dirname "${file}")
    nom_fichier=$(basename "${file}")

    # Création du nouveau chemin en conservant la structure du dossier
    nouveau_chemin="${destination}/${chemin_relatif}"

    # Création de la structure de dossiers
    mkdir -p "${nouveau_chemin}"

    # Copie du fichier dans le nouveau dossier avec la structure de dossiers
    cp "${file}" "${nouveau_chemin}/${nom_fichier}"

done

echo "La copie des fichiers est terminée."

tar -czvf AllTextures.tar.gz AllTextures

rm -rf AllTextures

echo "Le fichier zip contenant les textures a été créé."