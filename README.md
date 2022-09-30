A tool to download and update clamav databases and database patch files for the purposes of hosting your own database mirror.  
Dockerized version. 

See [original repo](https://github.com/Cisco-Talos/cvdupdate) for details. 

cvdupdate script is run every hour inside an Apache (with PHP module) image listening on port 80.  
It's up to you the choice to put the container behind a https reverse proxy (like NginX, Traefik, OpenLiteSpeed, ...) or to modify this image to accomplish this.

Maybe in the future i'll modify it to be more smart.

## Run the container
> (Customize it as you prefer)
```bash
docker run -d -p 8088:80 --name cvdupdate --hostname cvdupdate neomediatech/cvdupdate 
```

### Some command

Update local repository from ClamAV repository:

```bash
python3 -m cvdupdate update
```

Show config:

```bash
python3 -m cvdupdate config get
```

Set the path for the local repository:

```bash
python3 -m cvdupdate config set --dbdir /var/www/html
```

Set custom log directory:

```bash
python3 -m cvdupdate config set --logdir /logs
```

Get help:

```bash
python3 -m cvdupdate --help
```

