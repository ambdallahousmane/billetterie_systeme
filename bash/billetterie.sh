#!/bin/bash

# =============================
# Script : billetterie.sh
# Projet : billetterie.sh
# Auteur : OUSMANE Ambdallah
# =============================

echo "=== Script billetterie_systeme ==="

#Répertoires principaux
UML_DIR="uml"
XML_DIR="uml/xml"
IMG_DIR="uml/images"
LOG_DIR="logs"

# Création des dossiers nécessaires
mkdir -p "$XML_DIR" "$IMG_DIR" "$LOG_DIR"

echo "[OK] Dossiers UML et logd créés"

#Fichier de log
LOG_FILE="$LOG_DIR/script.log"

# Date d'exécution
echo "Execution du script : $(date)" >> "$LOG_FILE"

# Vérification de fichiers XML a la racine du projet
XML_FILE=$(ls *.xml 2>/dev/null)

if [ -z "$XML_FILES" ]; then
    echo "[INFO] Aucun fichier XML trouvé a la racine"
    echo "Aucun fichier XML a copier >> "$LOG_FILE"
else
    echo "[INFO] Fichiers XML détectés :"
    echo "$XML_FILES"
    
    # copie des fichiers XML
    cp *.cml "$XML_DIR"

    echo "[OK] Fichiers XML copiés vers $XML_DIR"
    echo "Fichiers XML copiés : $XML_FILES" >> "$LOG_FILE"

fi

echo "=== Fin du script ==="
echo "Script terminé avec succès" >> "$LOG_FILE"

