FROM debian

ENV VER=1.8.8

ENV SRC=arduino-$VER-linux64.tar.xz \
    DST=/usr/local

WORKDIR $DST

ADD https://downloads.arduino.cc/$SRC /tmp

RUN apt update \
&&  apt install -y xz-utils openjdk-8-jre \
&&  tar xf /tmp/$SRC \
&&  $DST/arduino-$VER/install.sh \
&&  rm -rf /tmp/$SRC /var/lib/apt/lists/*

CMD $DST/arduino-$VER/arduino
