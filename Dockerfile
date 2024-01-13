FROM i386/debian:12.4-slim

# 1) INSTALL BASICS
RUN apt-get update && apt-get install -y wget libc6 libstdc++6 --force-yes

# 2) Create user
RUN groupadd -r hlds
RUN useradd --no-log-init --system --create-home --home-dir /server --gid hlds  hlds
USER hlds

# 3) Install HLDS 3.1.1.1 and 3.1.1.e
RUN wget -q -O -  http://dl.4players.de/f0/4players/halflife/server/linux/hlds_l_3111_full.bin | \
  tail -c+8338 | head -c121907818 | \
  tar -xzf - -C /server

COPY install/hlds_l_3111e_update.tar.gz /server 
RUN tar -xzf /server/hlds_l_3111e_update.tar.gz -C /server

#RUN wget -q -O - http://dl.4players.de/f0/4players/halflife/mods/cstrike/server/linux/cs_15_full.tar.gz | \
#  tar -xzf - -C /server/hlds_l

WORKDIR /server/hlds_l/


#Install WON2Fixes and modified HLDS_RUN
USER root

COPY patch/* ./
COPY config/ ./
RUN chmod +x hlds_run

# Then, remove mod folders
RUN rm -rf ./tfc
RUN rm -rf ./dmc
RUN rm -rf ./ricochet
RUN rm -rf ./cstrike

USER hlds

# Expose required default ports
EXPOSE 27015
EXPOSE 27015/udp

ENV TERM xterm

ENTRYPOINT ["./hlds_run"]

CMD ["-game valve", "+map crossfire", "+maxplayers 16"]