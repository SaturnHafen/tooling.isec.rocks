#!/bin/bash

# connect via ssh
if [[ $1 ]]; then
  ssh $1
fi

echo "Searching for 'flags/interesting_file' with content 'isec{.*}'"
find / -type f -name flags/interesting_file -exec grep 'isec{.*}'  {} \;

echo "Searching for file with content 'isec{.*}'"
find -type f -exec grep 'isec{.*}'  {} \;

echo "Searching environment of current process"
printenv | grep 'isec{.*}'
