#!/bin/bash

DOCKNAME="cs15won2"
PORT=27015
MAP=de_dust2
MAXPLAYERS=16


MOD=cstrike
CFGPATH=$(pwd)/config/$MOD
FMOD=/server/hlds_l/$MOD

echo $CFGPATH

docker run -it \
-e GAME=$MOD \
-e MAP=$MAP \
-e MAXPLAYERS=$MAXPLAYERS \
-v $CFGPATH/cfg:$FMOD/cfg:ro \
-v $CFGPATH/server.cfg:$FMOD/server.cfg:ro \
-v $CFGPATH/motd.txt:$FMOD/motd.txt:ro \
-v $CFGPATH/mapcycle.txt:$FMOD/mapcycle.txt \
-p 27015:$PORT \
-p 27015:$PORT/udp \
--name $DOCKNAME hlds-won2:latest
