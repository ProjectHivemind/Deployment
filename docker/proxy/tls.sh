#!/bin/bash

# Check if making self-signed or pulling from lets-encrypt
if [[ $DOMAIN -ne "localhost" ]]
then # Lets-Encrypt
    apt-get update -y && apt-get install -y certbot
    certbot certonly $DOMAIN
    mv /etc/letsencrypt/live/$DOMAIN/privkey.pem /tmp/server.key
    mv /etc/letsencrypt/live/$DOMAIN/cert.pem /tmp/server.crt
else # Self-Signed
    apt-get update -y && apt-get install -y openssl
    openssl req -subj "/CN=$DOMAIN" -newkey rsa:4096 -nodes -keyout /tmp/server.key -x509 -days 365 -out /tmp/server.crt
fi
