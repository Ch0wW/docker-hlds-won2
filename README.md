# Half-Life 1.1.1.0 (WON2/Protocol 46) Image for Docker/Podman

This project generates a Docker/Podman image that automates setting up a Half-Life dedicated server, version 1.1.1.0, using the WON2 protocol (also known as **Protocol 46**). This image also allows using popular mods that are still played using this version which are Counter-Strike 1.5, 1.3, 1.1, 1.0, Beta 7.1. Team Fortress Classic and Deathmatch Classic are also included as a bonus. 

It can also work with CS 1.6 Beta, Day of Defeat v1.0 (Retail), and Condition Zero v1.0 (Retail) as long as you have the required files (that are not distributed for legal reasons).

## Disclaimer
**I am NOT responsible if your computer, server or game client has issues upon using this repository. You are basically attempting to host an unsupported, obsolete build of Half-Life that is ~25 years old and might have serious vulnerabilities**. Despite this repository makes you able to host a server with minimal efforts, you are, in other words, on your own.

## Need support?
**I can offer you direct support in making a server for CSWON2, however this is only restricted for Gold Tier members on Patreon.**
[![](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://patreon.baseq.fr)

#### Related projects
- [Docker/Podman image for HLDS 1.0.1.6](https://github.com/Ch0wW/docker-hlds-won2-1016)

---------------------

# Requirements
- Basic Linux skills,
- Either `docker` (easier to set up) **__OR__** `podman` version 5.4.2 or above (advanced to use but way more secure).

> [!TIP]
> - We will have to create a new user for safety reasons ; **I recommend you name it `hluser`, as I will use that name through the installation guide** ! 
> - Also, we assume you are using Debian 13 as your Linux OS. If not, please adapt some commands to your needs. 

### Why making this project ?

There are a few communities around the World that still play Counter-Strike 1.3, 1.5 or other classic mods of Half-Life. However, I have noticed that some Linux distributions are not acting friendly with this version of HLDS due to several incompatibilities, by either having command issues, or by crashing upon startup.

A workaround has been found since then, by using either Docker or Podman along with an old version of Debian 8, which allows creating "*sandboxed*" Linux environments. Since game preservation is important, I decided to provide a ready-to-use image to create a WON2 server in minutes. 

### Features
* Creates a barebones HLDS Environment using a sandboxed version of Debian 8 (i386).
* Only takes ~1Gb of Disk Space !
* Includes all the dedicated server files in its vanilla configuration that can be configured without recompiling the Docker image.
* Has WON2 patches, and advertises servers on both WON2.NET and the Order of Phalanx's masterservers.
* Includes Metamod 1.21p38 with AntiDLFix.

### Included mods
- Counter-Strike 1.5 (retail)
- Counter-Strike 1.3 (retail)
- Counter-Strike 1.1 (retail with patch 1.1c)
- Counter-Strike 1.0 (retail)
- Counter-Strike Beta 7.1
- Team Fortress Classic (v1.5)
- Deathmatch Classic

# Installation instructions

## Docker Installation 

0) If not already done, install Docker.

1) First of all, make sure you have created the `hluser` user on your server. Don't forget to add the user to the `docker` group:
```bash
adduser hluser
usermod -aG docker hluser
```

2) Log in as `hluser`.
```bash
su hluser
```

3) Clone the project, and enter the project's directory.

4) Build the image required for the server (will take several minutes)
```sh
docker build -t hlds1110:latest .
```

5) Then, copy the `docker-compose.yml` file to `docker-compose.override.yml`
```bash
cp docker-compose.yml docker-compose.override.yml
```

6) Edit `docker-compose.override.yml` to your likings.

> [!CAUTION]
> You need to set the UID/GID of the user you have created (using the command `id`), and replace it in the `user:"1000:1000"` part ; **otherwise you will have permission issues** regarding sprays.
>
> For instance, if you have the following:
> `uid=1012(hluser) gid=1013(hluser) groups=1013(hluser)`
> 
> You will write the following:
> `user:"1012:1013"`

>[!NOTE]
> The commandline that is used to start the server is located in the `command` part. 

If you need to change the port of your server, change the `-port 27015` parameter (in the `command` section) with the desired port of your choice.

> [!WARNING]
> if you desire to host a Counter-Strike Beta 7.1, 1.0, 1.1, 1.3, there will be a command **you will be required to add** at the end of your `command` subsection:
```
 +localinfo mm_gamedll "dlls/cs_i386.so"
```

For instance, here is a `docker-compose.override.yml` file which will create a CS 1.3 server on de_dust2 on port 27272 with 32 players slots: 

```yml
services:
  hlds:
    image: "hlds1110"
    restart: always
    network_mode: host
    volumes:
      - ./config/cstrk13:/server/cstrk13 
    command:
      - -port 27272 -game cstrk13 +map de_dust2 +maxplayers 32 +localinfo mm_gamedll "dlls/cs_i386.so"
```

7) Once done, just execute `docker compose up` to start up the server. If everything works well, you should be able to connect to the server.

In case you need to rebuild the image (for advanced purposes only), just type `docker compose build` and you should be good to go.


## Podman installation

0) If not already done, install Podman. If you also have package `acl`, it's a good time to install it as well.
```sh
sudo apt install podman acl
```

1) First of all, make sure you have created the `hluser` user on your server. Don't forget to add subuid/subgid support :
```bash
adduser hluser
usermod --add-subuids 100000-165535 --add-subgids 100000-165535 hluser
```

2) As `root`, we will enable lingering for our user (so that the server will still be active when not connected through SSH): 
```bash
loginctl enable-linger hluser
```

3) In a **new SSH connection**, connect as `hluser`.

4) Clone the project, and enter the project's directory.

5) We'll set proper permissions for later, so that our user `hluser` will still have access to files later on to the `config` subdirectories. This will fix new files permissions for both the container & our user, as well as allowing custom sprays to be saved.
```bash
setfacl -R -m d:u:hluser:rwx ./config/*
setfacl -R -m u:hluser:rwx ./config/*
```

6) Build the image required for the server (will take ~5 minutes)
```bash
podman build -t hlds1110:latest .
```

7) We will create the subfolders required for a rootless podman configuration, and copy the container inside it.
```bash
mkdir -p ~/.config/containers/systemd
cp hlds1110.container ~/.config/containers/systemd/
```

8) Edit `~/.config/containers/systemd/hlds1110.container` to your likings.

>[!NOTE]
> The commandline that is used to start the server is located in the `Exec` part. 

If you need to change the port of your server, change the `-port 27015` parameter (in the `command` section) with the desired port of your choice.

> [!WARNING]
> if you desire to host a Counter-Strike Beta 7.1, 1.0, 1.1, 1.3, there will be a command **you will be required to add** at the end of your `Exec` subsection:
```
 +localinfo mm_gamedll "dlls/cs_i386.so"
```

For instance, here is a container file (= *quadlet*) which will create a CS 1.3 server on cs_italy on port 27272 with 32 players slots: 

```ini
[Unit]
Description=HLDS 1.1.1.0 (WON2) Server
Wants=network-online.target
After=network-online.target

[Container]
Image=localhost/hlds1110
Network=host
PodmanArgs=-it
UserNS=keep-id

# Volumes
Volume=%h/docker-hlds-won2/config/cstrk13:/server/cstrk13:z

# Command user
Exec=-port 27272 -game cstrk13 +map cs_italy +maxplayers 32 +localinfo mm_gamedll "dlls/cs_i386.so"

[Service]
Restart=always
TimeoutSec=10

[Install]
WantedBy=multi-user.target
```

9) Refresh the systemd services & containers, then start the server.
```bash
systemctl --user daemon-reload
systemctl --user start hlds1110
```

> [!NOTE]
> - You will have to make one container file per server. 
> - If the service is not properly detected by podman/systemd, you can have a basic idea of what's wrong with this command : `/usr/libexec/podman/quadlet -dryrun -user`

> [!WARNING]
> Due to how systemd works, if you changed anything within the quadlet, or created a new quadlet, you will have to type `systemctl --user daemon-reload` in order to refresh the files. 

## Customizing your server configuration

Simply go to the `config` folder, and modify the required folders you wish.

- `config/cstrike` is for Counter-Strike 1.5.
- `config/cstrk13` is for Counter-Strike 1.3.
- `config/cstrk11r` is for Counter-Strike 1.1.
- `config/cstrk10r` is for Counter-Strike 1.0.
- `config/cstrk71` is for Counter-Strike Beta 7.1.
- `config/tfc` is for Team Fortress Classic. 
- `config/dmc` is for Deathmatch Classic. 
- `config/valve` is for Half-Life.

> [!NOTE]
> Since no playerbase exists for Half-Life WON2 (people play it on STEAM instead), none of the system files have been included. 
> If you still want to include custom data or config for a Half-Life 1 server, simply add whatever you wish inside the folder, and rebuild the image.


# Frequently Asked Questions

### Does this work with CS Beta 4.0 or very old betas?
❌ **NO**, as this is incompatible. However, [this Docker/Podman image for HLDS 1.0.1.6](https://github.com/Ch0wW/docker-hlds-won2-1016) can be used instead, as it supports a handful builds of Counter-Strike betas that worked on Linux.

### Does it work with ARM servers?
❌ **NO**. You need a x64 server, which is what most servers provide. An ARM->x86 emulator might work, but is entirely outside the scope of this project.

### Am I required to set "sv_lan" to "1"?
❌ **No need to** ! It's already included inside the modified `hlds_run` script !

### Does this project have bots?
❌ **Not at all**, since it is outside the scope of this project. You are free to install PodBOT or YAPB manually if you desire.

### What version of AMXX can I use? Because the latest version doesn't work...
You need to use AMXX 1.8.2 or lower. For easier searches, I included that version of AMXX inside `install/extras`.

### How can I control my server remotely?
You will need to set up a RCON password within your `server.cfg` file, as there's no easy way to directly control your HLDS container. (`rcon_password "mypassword"`)

### Can you set me up a server?
❌ **I can**, but I offer direct support on Gold Tier members on Patreon only. Please note you still need to rent or own a server for it.

### I've heard it's so easy to cheat using a modified binary, but can you block that?
✅ **You can**, however it will require AMXX (included) and a very specific plugin (not included as of now, as a modern rewrite is in the works).

-----------

This project uses files copyrighted by VALVe. 

[![](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://patreon.baseq.fr)