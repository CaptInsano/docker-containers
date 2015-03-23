#!/bin/sh
#This Script sets up SSL and BASIC Auth

# Check if htpasswd exists. If not, copy in the sample htpasswd
if [ -f /config/.htpasswd ]; then
	echo "Using existing AUTH file."
else
	echo "Creating htpasswd from template, Username/Password = admin/admin"
	cp  /htpasswd /config/.htpasswd
	chown torrent:www-data /config/.htpasswd
	chmod 777 /config/.htpasswd
fi
# Set up SSL if wanted by user
if [ "$SSL" == "1" ]
then
echo "Setting up SSL"
# Check if SSL Cert exists. If not, create one
if [ -f /config/certs/server.crt ]; then
	echo "Using existing SSL Cert."
else
	echo "Creating generic SSL Cert"
#this script generates a generic self-signed SSL certificate
	mkdir /config/certs
#create generic server.key and server.csr
	openssl req -new -newkey rsa:2048 -nodes -out /config/certs/server.csr -keyout /config/certs/server.key -subj "/C=/ST=07/L=/O=unraid/CN=unraid"
#Remove Passphrase from Key 
	mv /config/certs/server.key /config/certs/server.key.orig
	openssl rsa -in /config/certs/server.key.orig -out /config/certs/server.key
	rm /config/certs/server.key.orig
#Generating a Self-Signed Certificate
	openssl x509 -req -days 365 -in /config/certs/server.csr -signkey /config/certs/server.key -out /config/certs/server.crt
fi
elif [ "$SSL" == "0" ]
then
        echo "SSL=0, SSL not requested"
else
        echo "SSL variable not set"
fi
