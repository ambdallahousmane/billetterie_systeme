#!/bin/bash

DB_NAME="billetterie"
DB_USER="root"
DB_PAS="root"

read -p "Login : " LOGIN

ROLE=$(mysql -u$DB_USER -p$DB_PASS -D$DB_NAME -sN \
-e "SELECT role FROM utilisateur WHERE login='$LOGIN';")

if [ -z "$ROLE" ]; then
  echo "Utilisateur inconnu"
  exit 1
fi

export LOGIN
export ROLE
