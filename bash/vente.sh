#!/bin/bash

# ===============================
# Sceipt : vente.sh
# Role : vente d'un ticket
# ===============================


# Configuration MySQL
DB_NAME="billetterie"
DB_USER="rot"
BD_PASS="root"   # adapte si besoin

LOG_FILE="logs/actions.log"

echo "==== VENTE DE TICKET ====="

#Vérification utilisateur
read -p "Login caissier : " LOGIN

ROLE=$(mysql -u$DB_USER -p$DB_PASS -D $DB_NAME -sN \
-e "SELECT role FROM utilisateur WHERE login='$LOGIN';")

if [ "$ROLE" != "CAISSIER" ]; then
    echo "Accès refusé"
    exit 1
fi

# Saisie montant
read -p "Montant du ticket : " MONTANT

# Génération numéro de ticket
DATE=$(date +%Y%m%d)
COUNT=$(mysql -u$DB_USER -p$DB_PASS -D $DB_NAME -sN \
-e "SELECT COUNT(*) FROM ticket WHERE numero LIKE 'TCK-$DATE-%';")

NUMERO="TCK-$DATE-$(printf '%04d' $((COUNT + 1))"

#Transaction MySQL
mysql -u billet_user -phillet123 billetterie <<EOF
START TRANSACTION;

INSERT INTO vente(date_vente, total utilisateur_id)
VALUES (NOW(), $MONTANT,
       (SELECT id FROM utilissateur WHERE login='$LOGIN'));

INSERT INTO ticket(numero, date_vente, montant, caissier)
VALUES ('$NUMERO', NOW(),'$montant', '$login');

COMMIT;
EOF

#journalisation
echo "$(date) - Vente ticket $NUMERO par $LOGIN" >> $LOG_FILE

echo "Ticket vendu avec succès"
echo "Numéro du ticket : $NUMERO"

