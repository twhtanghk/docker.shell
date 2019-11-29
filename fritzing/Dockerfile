FROM debian

RUN apt update \
&&  apt install -y fritzing \
&&  rm -rf /var/lib/apt/lists/*

CMD /usr/bin/fritzing
