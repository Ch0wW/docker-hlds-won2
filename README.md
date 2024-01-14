# docker-hlds-won2
A docker image that automates setting up a 1.1.1.0 Half-Life / Counter-Strike 1.5 server, using the WON2 protocol.

# Requirements
- Docker
- docker-compose

### Why this docker ?

There are a few communities around the World that still play Counter-Strike 1.5 or other classic mods of Half-Life. However, I have noticed that some Linux distributions included an updated version of glibc that instantly crashes HLDS upon start due to incompatibilities.

That issue has been fixed since then, but I still wanted to provide a ready to use image for preservation purposes.

Since Docker allows creating sandboxed environment using other versions of Linux, I have noticed that someone already created a Docker for a *ready-to-use* WON2 server. However :
* It included AMXX and Podbot, something that is honestly *meh* unless you do exclusively play with friends.
* Customization was a little difficult to set up.
* I wanted to make sure everything is as vanilla as possible, so that everyone could modify their servers to their needs.

That is why I created this project, while trying to run this program in a safe environment (since this is a very outdated Half-Life build, and might be subject to vulnerabilities). It also includes a metamod patch that fixes a known exploit regarding downloads.

### Features
* Creates a barebones HLDS Environment using Debian 12 (i386).
* Includes all the dedicated server files in its vanilla configuration that can be configured outside the docker image.
* Has WON2 patches, and can advertise on dedicated masterservers.
* Includes Metamod 1.19 with AntiDLFix.

### Included mods
- Counter-Strike 1.5 (retail)
- Counter-Strike 1.3 (retail)
- Team Fortress Classic (v1.5)

### Installation/Usage

Simply edit the `docker-compose.yml` to add or modify anything you require.

If you need to change the port of your server, change all occurences (= in `ports` and in the `command` sections)

```
version: "3.0"

services:
  hlds:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - ./config/cstrike:/server/hlds_l/cstrike 
      - ./config/dmc:/server/hlds_l/dmc 
      - ./config/tfc:/server/hlds_l/tfc
    ports:
      - 27015:27015
      - 27015:27015/udp
    command:
      - ./hlds_run -port 27015 -game cstrike +map de_dust2 +maxplayers 16 +sv_lan 1
```

once done, just execute `docker-compose up` to make sure everything works as intended, and you should be good to go.

### Customisation

Simply go to the `config` folder, and modify the required folders you wish.

- `config/cstrike` is for Counter-Strike 1.5.
- `config/cstrk13` is for Counter-Strike 1.3.
- `config/tfc` is for Team Fortress Classic. 
- `config/dmc` is for Deathmatch Classic. 
- `config/valve` is for Half-Life. **However, since no server exists for Half-Life WON2 (as of 14/01/2024), it has not been included.** 


-----------

This project uses files copyrighted by VALVe. 