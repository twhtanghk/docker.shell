FROM ubuntu

ENV TMP=/tmp \
    SRC=Futu_OpenD_8.8.4818_Ubuntu16.04.tar.gz
COPY $SRC $TMP

RUN (tar -C /opt -xf $TMP/$SRC) \
&&  apt-get update \
&&  apt-get install -y telnet \
&&  apt-get clean
# &&  rm -rf /var/lib/apt/lists/* $TMP/$SRC

CMD ["/opt/Futu_OpenD_8.8.4818_Ubuntu16.04/Futu_OpenD_8.8.4818_Ubuntu16.04/FutuOpenD"]
