FROM debian:unstable

RUN apt update \
&&  apt install -y fldigi \
&&  rm -rf /var/lib/apt/lists/*

CMD /usr/bin/fldigi
