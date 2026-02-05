#!/bin/bash
echo "1. Vente ticket"
echo "2. Annulation ticket"
echo "3. Statistiques"
echo "4. Sauvegarde"
read choix

case $choix in 
1) echo "Vente en cours..." ;;
2) echo "Annulation..." ;;
3) echo "Statistiques..." ;;
4) mysqldump billeterie > backups/save_$(date +%F).sql ;;
esac

echo "$(date)  Action utilisateur" >> logs/actions.log
