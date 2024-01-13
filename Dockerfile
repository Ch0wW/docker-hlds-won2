FROM i386/debian:jessie-slim

# Recently Debian required to set apt repository to archive.debian.org. So, add a link to it.
RUN echo "deb http://archive.debian.org/debian jessie main contrib non-free" > /etc/apt/sources.list

# 1) INSTALL BASICS
RUN apt-get update && apt-get install -y wget --force-yes

# 2) Create user
RUN groupadd -r hlds
RUN useradd --no-log-init --system --create-home --home-dir /server --gid hlds  hlds
USER hlds

# 3) Install HLDS 3.1.1.1 and 3.1.1.e
RUN wget -q -O -  http://dl.4players.de/f0/4players/halflife/server/linux/hlds_l_3111_full.bin | \
  tail -c+8338 | head -c121907818 | \
  tar -xzf - -C /server
RUN wget -q -O - http://dl.4players.de/f0/4players/halflife/mods/cstrike/server/linux/cs_15_full.tar.gz | \
  tar -xzf - -C /server/hlds_l
RUN wget -q -O - http://dl.4players.de/f0/4players/halflife/server/linux/hlds_l_3111e_update.tar.gz | \
  tar -xzf - -C /server

WORKDIR /server/hlds_l/

#Install WON2Fixes and modified HLDS_RUN
USER root

COPY patch/* ./
COPY config/* ./
RUN chmod +x hlds_run

USER hlds

# Expose required default ports
EXPOSE 27015
EXPOSE 27015/udp

ENV TERM xterm

ENTRYPOINT ["./hlds_run"]

CMD ["-game valve", "+map crossfire", "+maxplayers 16"]