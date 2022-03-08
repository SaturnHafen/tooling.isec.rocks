# Tooling for the internet security lecture @ HPI (isec)

## `flagfinder.sh`

Searches for known flag-locations (optionally on a remote maschine).

```sh
./flagfinder.sh root@example.isec.rocks
```

```sh
./flagfinder.sh
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
