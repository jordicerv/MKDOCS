#!/bin/bash

# Defineix el directori del teu projecte MkDocs
PROJECT_DIR="/home/alumnat/prova"

# Navega al directori del projecte
cd "$PROJECT_DIR" || { echo "El directori no s'ha trobat."; exit 1; }

# Construir la documentació amb MkDocs
mkdocs build || { echo "Error en la construcció de MkDocs."; exit 1; }

# Navega al directori 'site/'
cd site/ || { echo "El directori 'site/' no s'ha trobat."; exit 1; }

# Afegeix els fitxers generats
echo "Afegint fitxers al repositori..."
git add . || { echo "Error en afegir fitxers a Git."; exit 1; }

# Realitza un commit
git commit -m "Pujar fitxers generats per MkDocs" || { echo "Error en fer el commit."; exit 1; }

# Puja els fitxers al repositori remot
echo "Pujant fitxers al repositori de GitHub..."
git push -u origin main || { echo "Error en pujar al repositori remot."; exit 1; }

echo "Pujada exitosa!"
