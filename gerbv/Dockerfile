FROM debian

RUN apt update \
&&  apt install -y gerbv \
&&  rm -rf /var/lib/apt/lists/*

CMD /usr/bin/gerbv
