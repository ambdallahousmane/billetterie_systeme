#!/bin/bash

# ============================
# Script : menu.sh
# Role   : Menu principal
# ============================

clear
echo "========================="
echo " SYSTEME DE GESTION DE BILLETTERIE"
echo "=========================="
echo "1. Vendre un ticket"
echo "2. Annuler un ticket"
echo "3. Statistiques"
echo "4. Sauvegarde de la base"
echo "0. Quitter"
echo "--------------------------"

read -p "Votre choix : " CHOIX

case $CHOIX in
  1)
     ./bash/vente.sh
     ;;
  2)
     ./bash/annulation.sh
     ;;
  3)
     ./bash/stats.sh
     ;;
  4)
     ./bash/sauvegarde.sh
     ;;
  0)
     echo "Au revoir"
     exit 0
     ;;
  *)
     echo "Choix invalide"
     ;;
 esac

 echo ""
 read -p "Appuyez sur Entrée pour revenir au menu..."
 
