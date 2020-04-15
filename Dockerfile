FROM i386/debian:jessie

# 1) INSTALL BASICS
RUN apt-get update && apt-get install -y unzip wget

# 2) Create user
RUN echo "# ============ CREATE USER AND GROUP ============"
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

# 4) Install WON2Fixes and modified HLDS_RUN
COPY patch/* ./
COPY config/valve valve
COPY config/cstrike cstrike

# Expose required default ports
EXPOSE 27015
EXPOSE 27015/udp

ENV TERM xterm

CMD ["./hlds_run"]
