# Overview
* This repository makes the image https://hub.docker.com/r/sioncojp/circusd/

# Usage
## build image
```shell
$ cd /path/to/sioncojp/circusd
$ docker build -t "sioncojp/circusd:latest" .
$ docker run
```

## running container
```shell
$ ls -1 /tmp/test/app1
app

$ docker run -d --name app1 -v /tmp/test/app1:/tmp/ -it sioncojp/circusd:latest
$ docker exec app1 /etc/init.d/circusd restart

$ ls -1 /tmp/test/app1
app
app.sock
```
