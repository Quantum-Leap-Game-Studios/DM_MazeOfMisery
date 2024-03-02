#!/bin/bash

# Remplir le dossier
files=`find . -type f -path "*/Textures/*"`
for file in $files; do

    git rm $file

done

echo "Les fichiers textures ont été supprimé."