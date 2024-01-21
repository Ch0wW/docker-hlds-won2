# docker-hlds-won2

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/P5P27UZHV)

This project generates a Docker image that automates setting up a Half-Life dedicated server, version 1.1.1.0, using the WON2 protocol. This docker image also includes several popular mods that are still played using this version which are Counter-Strike 1.5, 1.4, 1.3, 1.1, Team Fortress Classic, and Deathmatch Classic.

#### Related projects
- [Docker image for HLDS 1.0.1.6](https://github.com/Ch0wW/docker-hlds-won2-1016)
- [Docker image for HLDS 1.1.0.4](https://github.com/Ch0wW/docker-hlds-won2-1104)

---------------------

# Requirements
- docker
- docker-compose

### Why this docker ?

There are a few communities around the World that still play Counter-Strike 1.5 or other classic mods of Half-Life. However, I have noticed that some Linux distributions are not friendly with this version of HLDS due to potential library incompatibilities, and may instantly crash upon starting.

A workaround was found since then, but I still wanted to provide a ready to use image for preservation purposes. Since Docker allows creating "*sandboxed*" environments using other versions of Linux, I created this project. 

### Features
* Creates a barebones HLDS Environment using Debian 12 (i386).
* Includes all the dedicated server files in its vanilla configuration that can be configured outside the docker image.
* Has WON2 patches, and can advertise on dedicated masterservers.
* Includes Metamod 1.19 with AntiDLFix.

### Included mods
- Counter-Strike 1.5 (retail)
- Counter-Strike 1.4 (retail)
- Counter-Strike 1.3 (retail)
- Counter-Strike 1.1 (retail with patch 1.1c)
- Team Fortress Classic (v1.5)
- Deathmatch Classic

### Installation/Usage

Simply edit the `docker-compose.yml` to add or modify anything you require.

If you need to change the port of your server, change all occurences of `27015` (= in `ports` and in the `command` sections) to the desired port of your choice.

```yml
version: "3.0"

services:
  hlds:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - ./config/cstrike:/server/hlds_l/cstrike 
      - ./config/cstrk11r:/server/hlds_l/cstrk11r
      - ./config/cstrk13:/server/hlds_l/cstrk13 
      - ./config/cstrk14:/server/hlds_l/cstrk14
      - ./config/dmc:/server/hlds_l/dmc 
      - ./config/tfc:/server/hlds_l/tfc
    ports:
      - 27015:27015
      - 27015:27015/udp
    command:
      - -port 27015 -game cstrike +map de_dust2 +maxplayers 16
```

Once done, just execute `docker-compose up` to make sure everything works as intended, and you should be good to go. Change also the `user` token so that it is checking with the user and group running the container, to avoid upload issues or potential permission problems.

If you need to rebuild the image (for instance for testing or to add a few additional things), just type `docker-compose build` and you should be good to go.

### Customising your server configuration

Simply go to the `config` folder, and modify the required folders you wish.

- `config/cstrike` is for Counter-Strike 1.5.
- `config/cstrk14` is for Counter-Strike 1.4.
- `config/cstrk13` is for Counter-Strike 1.3.
- `config/cstrk11r` is for Counter-Strike 1.1.
- `config/tfc` is for Team Fortress Classic. 
- `config/dmc` is for Deathmatch Classic. 
- `config/valve` is for Half-Life. **However, since no playerbase really exists for Half-Life WON2 (people play it on STEAM instead), none of the system files have been included. If you still want to include custom data for your server, simply add whenever you wish inside the folder, and rebuild the image** 

-----------

This project uses files copyrighted by VALVe. 