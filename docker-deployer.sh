#! /bin/bash
scp dockerchecker.sh $1:dockerchecker.sh
scp flagfinder.sh $1:flagfinder.sh

ssh $1 "chmod +x dockerchecker.sh; chmod +x flagfinder.sh; ./dockerchecker.sh"
