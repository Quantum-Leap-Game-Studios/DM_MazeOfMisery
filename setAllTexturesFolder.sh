#!/bin/bash

# Le fichier tar.gz
zipfile="AllTextures.tar.gz"

# Unzip le fichier
files=$(tar -xzvf $zipfile | grep -v '/$' | awk '{print $NF}')

# Remplir le dossier
for file in $files; do

    # Extraction du chemin relatif et du nom du fichier
    chemin_relatif=$(dirname "${file}")
    nom_fichier=$(basename "${file}")

    # Création du nouveau chemin en conservant la structure du dossier
    chemin_modifie=$(echo "$chemin_relatif" | sed 's|AllTextures/||')
    nouveau_chemin="./${chemin_modifie}"

    # Création de la structure de dossiers
    mkdir -p "${nouveau_chemin}"

    # Copie du fichier dans le nouveau dossier avec la structure de dossiers
    cp "${file}" "${nouveau_chemin}/${nom_fichier}"

done

echo "La copie des fichiers est terminée."

rm -rf AllTextures
