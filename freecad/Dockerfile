FROM debian:unstable

RUN apt update \
&&  apt install -y freecad \
&&  rm -rf /var/lib/apt/lists/*

CMD /usr/bin/freecad
