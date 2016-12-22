FROM python:2

RUN useradd -ms /bin/bash -G dialout user && \
    pip install pyserial && \
    apt-get update && \
    apt-get install -y git autoconf gperf flex bison texinfo gawk help2man wget libtool-bin ncurses-dev unzip

USER user
WORKDIR /home/user

RUN git clone https://github.com/espruino/Espruino && \
    git clone --recursive https://github.com/pfalcon/esp-open-sdk.git && \
    (cd esp-open-sdk; make)

ENTRYPOINT top -b -d 1000
