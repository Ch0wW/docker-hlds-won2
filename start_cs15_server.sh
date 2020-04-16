#!/bin/bash

# DO NOT FORGET TO UNCOMMENT AND MODIFY THIS LINE !
#cd /to/your/docker/repository

DOCKNAME="cs15won2"
PORT=27015
MAP="de_dust2"
MAXPLAYERS=16

MOD=cstrike
CFGPATH=$(pwd)/config/$MOD
FMOD=/server/hlds_l/$MOD

docker run --rm -d -it \
-v $CFGPATH/cfg:$FMOD/cfg:ro \
-v $CFGPATH/server.cfg:$FMOD/server.cfg:ro \
-v $CFGPATH/motd.txt:$FMOD/motd.txt:ro \
-v $CFGPATH/mapcycle.txt:$FMOD/mapcycle.txt:ro \
-p $PORT:27015 \
-p $PORT:27015/udp \
--name $DOCKNAME hlds-won2 -game $MOD +map $MAP +maxplayers $MAXPLAYERS
