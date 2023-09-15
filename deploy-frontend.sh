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

echo "1/2: Create remote directory..."
sshpass -P "$PWD_REQUEST_PHRASE" -p "$PWD" ssh -o StrictHostKeyChecking=no "$SERVER" "cd .. && 
rm -r app/Mondmonolith/frontend/MondmonolithFrontend/ && 
mkdir -p app/Mondmonolith/frontend/MondmonolithFrontend/"


upload() {
	echo "===> $1"
	#use sshpass with flag -v for details
	sshpass -P "$PWD_REQUEST_PHRASE" -p "$PWD" scp -r "$1" "$2"
}

echo "2/2: Uploading frontend build directory..."
upload frontend/MondmonolithFrontend/build/ "$SERVER":/app/Mondmonolith/frontend/MondmonolithFrontend/

echo "Done!"
