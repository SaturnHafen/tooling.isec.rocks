#!/bin/bash

echo 'Searching environment of current process'
printenv | grep -H -s -i -o --color=always '.*isec{.*}'

echo 'Searching environment of all processes'
ps auxe | grep -H -s -i -o --color=always '.*isec{.*}'

echo 'ripgrep uses ALL paramters. Might be slow. Tweak to your needs.'
echo 'Start ripgrep in /home/'
./rg --follow --pretty --no-ignore --text --no-mmap --search-zip -j1 -o --hidden -i 'isec\{.*\}' /home/ 2>> error_log

echo 'Strat ripgrep in /root/'
./rg --follow --pretty --no-ignore --text --no-mmap --search-zip -j1 -o --hidden -i 'isec\{.*\}' /root/ 2>> error_log

echo 'Start ripgrep in /'
./rg --follow --pretty --no-ignore --text --no-mmap --search-zip -j1 -o --hidden -i -g '!/home/' -g '!/root/' 'isec\{.*\}' / 2>> error_log

echo 'Searching for "interesting_file"'
find / -L -type f -name interesting_file 2>> error_log

echo 'Searching for "hint"'
find / -L -type f -name hint 2>> error_log

