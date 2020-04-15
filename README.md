# docker-hlds-won2
A docker image that creates a WON2 Half-Life / Counter-Strike 1.5 server for you.

### Why this docker ?

There are a few communities around the World that still play Counter-Strike 1.5 or other classic mods of Half-Life using WON. However, latest versions of Linux include an updated version of glibc that makes impossible to run it. Plus, they do not include security patches that were added by the community. This Docker image has been created to make it possible, while staying in a safe environment.

### Usage

1) Build locally (online image in the works) :
> docker build -t hlds-won2 .

2) Run the image (valve)
> docker run --name cs15won2 -p 27015:27015 -p 27015:27015/udp hlds-won2

By default, it will run a Half-Life server. If you want to run a CS 1.5 server :
> docker run --name cs15won2 -p 27015:27015 -p 27015:27015/udp -e GAME=cstrike -e MAXPLAYERS=16 -e MAP=de_dust2 hlds-won2

### Customisation
  
You can also modify the files in /configs folder, and then adapt the .sh file with your current folder in order to customise its contents.
