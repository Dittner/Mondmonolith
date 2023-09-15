#!/bin/bash

# Before starting deploy:
# Stop server: $ docker-compose stop (Ctrl C)
# !!! Do not remove containers, do not use <docker-compose down> or <docker container prune>

# After deploy:
# Run server: $ docker-compose up --build

SERVER="root@159.89.10.146"
PWD_REQUEST_PHRASE="Enter passphrase"

echo "$SERVER"
echo Enter passphrase:
read -s PWD
echo

echo "1/3: Create remote directories..."
sshpass -P "$PWD_REQUEST_PHRASE" -p "$PWD" ssh -o StrictHostKeyChecking=no "$SERVER" "cd .. && 
rm -r app/Mondmonolith/api && 
rm -r app/Mondmonolith/frontend && 
rm -r app/Mondmonolith/nginx && 
mkdir -p app/Mondmonolith/api/MondmonolithApi/target/ &&
mkdir -p app/Mondmonolith/frontend/MondmonolithFrontend/"

echo "2/3: Uploading docker files..."
upload() {
	echo "===> $1"
	#use sshpass with flag -v for details
	sshpass -P "$PWD_REQUEST_PHRASE" -p "$PWD" scp -r "$1" "$2"
}

upload api/Dockerfile "$SERVER":/app/Mondmonolith/api/
upload frontend/Dockerfile "$SERVER":/app/Mondmonolith/frontend/
upload frontend/nginx/ "$SERVER":/app/Mondmonolith/frontend/
upload nginx/ "$SERVER":/app/Mondmonolith/
upload docker-compose.yml "$SERVER":/app/Mondmonolith/

echo "3/3: Uploading build files..."
upload frontend/MondmonolithFrontend/build/ "$SERVER":/app/Mondmonolith/frontend/MondmonolithFrontend/
upload api/MondmonolithApi/target/*.jar "$SERVER":/app/Mondmonolith/api/MondmonolithApi/target/

echo "Done!"
