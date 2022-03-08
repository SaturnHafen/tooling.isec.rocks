#! /bin/bash
scp $1:dockerchecker.sh dockerchecker.sh
scp $1:flagfinder.sh flagfinder.sh

ssh $1 "chmod +x $2; ./dockerchecker.sh"
