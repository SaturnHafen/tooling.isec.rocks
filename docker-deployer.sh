#! /bin/bash


# copy your public key to remote to allow key-login
echo "adding your public key to the remote service..."
ssh-copy-id -i ~/.ssh/id_rsa.pub $1

# copy relevant files to remote maschine
scp dockerchecker.sh $1:dockerchecker.sh
scp flagfinder.sh $1:flagfinder.sh

ssh $1 "chmod +x dockerchecker.sh; chmod +x flagfinder.sh; ./dockerchecker.sh"
