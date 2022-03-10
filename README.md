# Tooling for the internet security lecture @ HPI (isec)

## `flagfinder.sh`

Searches for known flag-locations.

```sh
./flagfinder.sh
```

## `dockerchecker.sh`

Checks for some common security problems inside a docker container

```sh
./dockerchecker.sh
```

## `docker-deployer.sh`

Adds your public key (`~/.ssh/id_rsa.pub`) to the remote server, copies both `flagfinder.sh` and `dockerchecker.sh` to the remote service using scp and runs them

```sh
./docker-deployer.sh root@example.isec.rocks
```

If your server listens on a custom port

```sh
./docker-deployer.sh root@example.isec.rocks 1025
```

## `passwordcrack.sh`

Copies `/etc/passwd` & `/etc/shadow` to your local maschine using scp, `unshadow`s the selected user and starts the passwordcracking with john (rockyou wordlist).

If you still need to download `/etc/passwd` & `/etc/shadow`

> Note: You need to login as root to copy the `/etc/shadow` file

```sh
./passwordcrack.sh -d root@example.isec.rocks username
```

If you already downloaded `/etc/passwd` & `/etc/shadow`

> Note: Both files are expected to live in `.`

```sh
./passwordcrack.sh username
```
