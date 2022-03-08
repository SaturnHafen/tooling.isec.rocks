#!/bin/bash

echo 'Searching for "flags/interesting_file" with content "isec{.*}"'
find / -type f -name interesting_file -exec grep 'isec{.*}'  {} \; 2>/dev/null

echo 'Searching for file with content "isec{.*}"'
find / -type f -exec grep 'isec{.*}'  {} \; 2>/dev/null

echo 'Searching environment of current process'
printenv | grep 'isec{.*}'

ps auxe | grep 'isec{.*}'
