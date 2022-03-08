# Tooling for the internet security lecture @ HPI (isec)

## `flagfinder.sh`

Searches for known flag-locations on a remote maschine.

```sh
./flagfinder.sh root@example.isec.rocks
```

## `passwordcrack.sh`

Copies `/etc/passwd` & `/etc/shadow` to your local maschine using scp, `unshadow`s the selected user and starts the passwordcracking with john (rockyou wordlist).

> Note: You need to login as root to copy the `/etc/shadow` file

```sh
./passwordcrack.sh root@example.isec.rocks username
```
