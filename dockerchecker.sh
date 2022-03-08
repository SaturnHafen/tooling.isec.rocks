#! /bin/bash

# is docker installed?
docker &>/dev/null
if [[ $? -eq 0 ]]; then
  echo "docker is installed!"

  # is docker socket mounted? / rw-access?
  docker ps &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "we can talk to the docker deamon!"
  fi

  # available images
  echo "available images: "
  docker images
fi

# is container priviledged?
ip link add dummy0 type dummy &>/dev/null
if [[ $? -eq 0 ]]; then
    echo "we are priviledged!"

    ip link delete dummy0 >/dev/null
fi

echo "available harddisks"
# misc: harddisks
lsblk

echo "running flagfinder"
# misc: flagfinder
./flagfinder.sh
