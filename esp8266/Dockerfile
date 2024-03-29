FROM python:3

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN apt update \
&&  apt install -y vim picocom minicom \
&&  apt clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  pip3 install cryptography==3.4.6 \
&&  pip3 install pyserial esptool rshell
