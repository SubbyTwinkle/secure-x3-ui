#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y sqlite3 # to make sure nothing will fuck up and sqlite will install successfully

# Creating a folder for files and going to to this folder
mkdir cert
cd cert

openssl genrsa -out secret.key 2048
IP_ADDRESS=$(hostname -I | awk '{print $1}') # Getting the first IP address
openssl req -new -key secret.key -out cert.csr -subj "/CN=$IP_ADDRESS"
openssl x509 -signkey secret.key -in cert.csr -req -days 99999 -out cert.crt

# Getting the current working directory
PWD=$(pwd)

# Path to SQLite file that contains settings and cert paths
DB_PATH="/etc/x-ui/x-ui.db"

# Adding records to the settings table
sqlite3 "$DB_PATH" <<EOF
INSERT INTO settings (id, key, value) VALUES (4, 'webListen', NULL);
INSERT INTO settings (id, key, value) VALUES (5, 'webDomain', NULL);
INSERT INTO settings (id, key, value) VALUES (6, 'webCertFile', '$PWD/cert.crt');
INSERT INTO settings (id, key, value) VALUES (7, 'webKeyFile', '$PWD/secret.key');
EOF

x-ui restart

# Look, user! The address is now displayed with httpS!
echo "10" | x-ui

printf "All set! You can use panel now!"