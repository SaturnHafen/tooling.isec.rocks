#!/bin/bash

ssh $1

echo "Searching for 'flags/interesting_file' with content 'isec{.*}'"
find / -type f -name flags/interesting_file -exec grep 'isec{.*}'  {} \;

echo "Searching for file with content 'isec{.*}'"
find -type f -exec grep 'isec{.*}'  {} \;

if [[ $2 ]]; then
  echo "Searching for 'flags/'"
  find / flags/

  echo "Searching for 'interesting_file'"
  find / --name interesting_file
fi
