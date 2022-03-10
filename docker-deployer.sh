#! /bin/bash

KEYFILE="~/.ssh/id_rsa.pub"

if [[ $# -eq 1 ]]; then
  echo "Using default port 22"
  PORT=22
else
  echo "Using custom port"
  PORT=$2
fi

# copy your public key to remote to allow key-login
echo "adding your public key to the remote service..."
ssh-copy-id -i -p $PORT $KEYFILE $1

# copy relevant files to remote maschine
scp dockerchecker.sh $1:dockerchecker.sh -p $PORT
scp flagfinder.sh $1:flagfinder.sh -p $PORT

ssh $1 "chmod +x dockerchecker.sh; chmod +x flagfinder.sh; ./dockerchecker.sh"
