# docker-hlds-won2

[![](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://patreon.baseq.fr)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/P5P27UZHV)

This project generates a Docker image that automates setting up a Half-Life dedicated server, version 1.1.1.0, using the WON2 protocol. This docker image also includes several popular mods that are still played using this version which are Counter-Strike 1.5, 1.3, 1.1, 1.0, Beta 7.1, Team Fortress Classic, and Deathmatch Classic.

#### Related projects
- [Docker image for HLDS 1.0.1.6](https://github.com/Ch0wW/docker-hlds-won2-1016)

---------------------

# Requirements
- docker
- docker-compose

### Why this docker ?

There are a few communities around the World that still play Counter-Strike 1.5 or other classic mods of Half-Life. However, I have noticed that some Linux distributions are not friendly with this version of HLDS due to potential library incompatibilities, and may instantly crash upon starting.

A workaround was found since then, but I still wanted to provide a ready to use image for preservation purposes. Since Docker allows creating "*sandboxed*" environments using other versions of Linux, I created this project. 

### Features
* Creates a barebones HLDS Environment using Debian (i386).
* Includes all the dedicated server files in its vanilla configuration that can be configured outside the docker image.
* Has WON2 patches, and can advertise on dedicated masterservers.
* Includes Metamod 1.19 with AntiDLFix.

### Included mods
- Counter-Strike 1.5 (retail)
- Counter-Strike 1.3 (retail)
- Counter-Strike 1.1 (retail with patch 1.1c)
- Counter-Strike 1.0 (retail)
- Counter-Strike Beta 7.1
- Team Fortress Classic (v1.5)
- Deathmatch Classic

### Installation/Usage

Simply edit the `docker-compose.yml`, or copy it to `docker-compose.override.yml` to add or modify anything you require.

If you need to change the port of your server, change all occurences of `27015` (= in `ports` and in the `command` sections) to the desired port of your choice.

```yml
version: "3.0"

services:
  hlds:
    build:
      context: .
      dockerfile: Dockerfile
    restart: always
    volumes:
      - ./config/cstrike:/server/hlds_l/cstrike 
      - ./config/cstrk10r:/server/hlds_l/cstrk10r
      - ./config/cstrk11r:/server/hlds_l/cstrk11r
      - ./config/cstrk13:/server/hlds_l/cstrk13 
      - ./config/cstrk71:/server/hlds_l/cstrk71
      - ./config/dmc:/server/hlds_l/dmc 
      - ./config/tfc:/server/hlds_l/tfc
    ports:
      - 27015:27015
      - 27015:27015/udp
    command:
      - -port 27015 -game cstrike +map de_dust2 +maxplayers 16
    security_opt:
      - no-new-privileges:true
```

Once done, just execute `docker-compose up` to make sure everything works as intended, and you should be good to go. Change also the `user` token so that it is checking with the user and group running the container, to avoid upload issues or potential permission problems.

In case you need to rebuild the image, just type `docker-compose build` and you should be good to go.

### Important information !

If you desire to host a Counter-Strike Beta 7.1, 1.0, 1.1, 1.3, there will be a command **you will be required to add** at the end of your `command` subsection:

```
+localinfo mm_gamedll "dlls/cs_i386.so"
```

Example with a Counter-Strike 1.3 server:

```yml
version: "3.0"

services:
  hlds:
    build:
      context: .
      dockerfile: Dockerfile
    restart: always
    volumes:
      - ./config/cstrk13:/server/hlds_l/cstrk13 
    ports:
      - 27015:27015
      - 27015:27015/udp
    command:
      - -port 27015 -game cstrk13 +map de_dust2 +maxplayers 16 +localinfo mm_gamedll "dlls/cs_i386.so"
    security_opt:
      - no-new-privileges:true
```


### Customizing your server configuration

Simply go to the `config` folder, and modify the required folders you wish.

- `config/cstrike` is for Counter-Strike 1.5.
- `config/cstrk13` is for Counter-Strike 1.3.
- `config/cstrk11r` is for Counter-Strike 1.1.
- `config/cstrk10r` is for Counter-Strike 1.0.
- `config/cstrk71` is for Counter-Strike Beta 7.1.
- `config/tfc` is for Team Fortress Classic. 
- `config/dmc` is for Deathmatch Classic. 
- `config/valve` is for Half-Life. **However, since no playerbase really exists for Half-Life WON2 (people play it on STEAM instead), none of the system files have been included. If you still want to include custom data for your server, simply add whatever you wish inside the folder, and rebuild the image** 

### Am I required to set "sv_lan" to "1"?
Nope! It's already included inside the modified `hlds_run` script, so you don't have to!

-----------

This project uses files copyrighted by VALVe. 