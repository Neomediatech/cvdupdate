#!/bin/bash

if [ ! -d ~/.cvdupdate ]; then
  python3 -m pip install --user cvdupdate
  python3 -m cvdupdate config set 
  python3 -m cvdupdate config set --dbdir /var/www/html
fi

while true; do python3 -m cvdupdate update -V; sleep 3600; done &

exec "$@"

