#!/bin/bash
BASEPATH=`pwd`
IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
echo run gitea on $IP host
docker run -dit --restart unless-stopped -p 3000:3000 -p 22:22 -v "$BASEPATH/data:/data" --add-host "dockerhost:$IP" -i -t aniqma/gitea
