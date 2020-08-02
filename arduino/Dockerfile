FROM debian:unstable

ENV VER=1.8.13

ENV SRC=arduino-$VER-linux64.tar.xz \
    DST=/usr/local

WORKDIR $DST

ADD https://downloads.arduino.cc/$SRC /tmp

RUN apt update \
&&  apt install -y xz-utils openjdk-14-jre \
&&  tar xf /tmp/$SRC \
&&  $DST/arduino-$VER/install.sh \
&&  rm -rf /tmp/$SRC /var/lib/apt/lists/*

CMD $DST/arduino-$VER/arduino
