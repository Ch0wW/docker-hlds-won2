# docker-hlds-won2
A docker image that automates setting up a 1.1.1.0 Half-Life / Counter-Strike 1.5 server, using the WON2 protocol.

### Why this docker ?

There are a few communities around the World that still play Counter-Strike 1.5 or other classic mods of Half-Life using WON. However, I have noticed that latest Linux releases include an updated version of glibc that instantly crashes HLDS upon start.

Since Docker allows creating sandboxed environment using other versions of Linux, I have noticed that someone already created a Docker for a *RTU* WON2 server. However :

* The Docker image doesn't properly work on Debian 9 and onwards (the server just refuses to start).
* It includes AMXX and Podbot, something that is honestly *meh* unless you do exclusively play with friends.
* Customization was a little difficult to set up.

This Docker image has been created to make it as barebones as possible, while staying in a safe environment. It also includes a metamod patch that fix an exploit with downloads.

### Features
* Creates a barebones HLDS Environment using Debian 8 (i386).
* Includes Half-Life 1, DMC, TFC, CStrike 1.5 dedicated server files.
* Has WON2 patches, and advertises on dedicated masterservers.
* Includes Metamod 1.19 with AntiDLFix.

### Installation/Usage (Manual method)


1) Build locally the image :
> docker build -t hlds-won2 . 

2) Run the image. **By default, it will run Half-Life on Crossfire with 16 players** :
> docker run -it --rm -d --name hldswon2 -p 27015:27015 -p 27015:27015/udp hlds-won2

If you want to run a CS 1.5 server, use this command instead :
> docker run -it --rm -d --name cs15won2 -p 27015:27015 -p 27015:27015/udp hlds-won2 -game cstrike +map de_dust2 +maxplayers 16

### Customisation
  
**If you want to add maps or modify the config, you need to rebuild the image !!**

Any command or CVar ou would use originally needs to be placed **AFTER** the image name.

If you want to change the config file, you need to mount it using the fullpath.

> docker run -it --rm -d --name cs15won2 -p 27015:27015 -p 27015:27015/udp -v /full/path/to/server.cfg:/server/hlds_l/cstrike/server.cfg hlds-won2 -game cstrike 

