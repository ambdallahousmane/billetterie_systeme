#!/bin/bash

# ==========================================
# Script : annulation.sh
# Role   : Annulation sécurisée d'un ticket
# ===========================================

# Configuration MySQl
DB_NAME="billetterie"
DB_USER="root"
DB_PASS="root"  # adapte si necessaire

LOG_FILE="logs/actions.log"

echo "==== ANNULATION DE TICKET ===="

# Authentification caissier
read -p "Login caissier : " LOGIN

ROLE=$(mysql -u$DB_USER -p$DB_PASS -D $DB_NAME -sN \
-e "SELECT role FROM utilisateur WHERE login='$LOGIN='$LOGIN';")

if [ "$ROLE" != 3CAISSIER" ]; then
  echo "Accès refusé : droits insuffisants"
  exit 1
fi

#Saisie du numéro de ticket
read -p "Numéro du ticket a annuler : " NUMERO

# Vérification de l'existence et du statut du ticket
STATUT=$(mysql -u$DB_USER -p$DB_PASS -D $DB_NAME -sN \
-e "SELECT statut FROM ticket WHERE numero='$NUMERO';")

if [ -z "$STATUT" ]; then
  echo "Ticket inexistant"
  exit 1
fi

if [ "$STATUT" = "ANNULE" ]; then
  echo "Ce ticket est déja annulé"
  exit 1
fi

# Motif d'annulation
read -p "Motif de l'annulation : " MOTIF

# Transaction sécurisée
mysql -u$DB_USER -p$DB_PASS -D $DB_NAME <<EOF
START TRANSACTION;

INSERT INTO annulation(date_annulation, motif, ticket_id)
VALUES (
  NOW(),
   '$MOTIF'
  (SELECT id FROM ticket WHERE numero='$NUMERO')
);

UPDATE ticket
SET statut = 'ANNULE'
WHERE numero = '$NUMERO';

COMMIT;
EOF

# Journalisation 
echo "$(date) - Annulation ticket $NUMERO par $LOGIN (motif: $MOTIF)" >> $LOG_FILE
echo "Ticket annulé avec succès"
