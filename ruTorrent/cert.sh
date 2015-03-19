#!/bin/sh

#this script generates a generic self-signed SSL certificate

#create generic server.key and server.csr
openssl req -new -newkey rsa:2048 -nodes -out /config/certs/server.csr -keyout /config/certs/server.key -subj "/C=/ST=07/L=/O=unraid/CN=unraid"
#Remove Passphrase from Key 
mv /config/certs/server.key /config/certs/server.key.orig
openssl rsa -in /config/certs/server.key.orig -out /config/certs/server.key
rm /config/certs/server.key.orig
#Generating a Self-Signed Certificate
openssl x509 -req -days 365 -in /config/certs/server.csr -signkey /config/certs/server.key -out /config/certs/server.crt