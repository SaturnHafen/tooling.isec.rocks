#! /bin/bash
ssh_key="/home/$USER/.ssh/KEY"
if [ "$#" -lt 3 ]; then
    echo "[!] Usage $0 [username] [adress] [port]"
    exit 1
fi

user=$1
adress=$2
port=$3

# copy your public key to remote to allow key-login
echo "adding your public key to the remote service..."
ssh-copy-id -i $ssh_key -p "$port" "$user@$adress"
# copy relevant files to remote maschine
scp -i ~/.ssh/github -P "$port" flagfinder.sh dockerchecker.sh rg "$user@[$adress]:~"

# Make files executable
ssh "$user@$adress" -i ~/.ssh/github "chmod +x dockerchecker.sh; chmod +x flagfinder.sh; chmod +x rg"

#Connect to machine
ssh "$user@$adress" -i ~/.ssh/github
