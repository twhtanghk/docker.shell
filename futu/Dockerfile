FROM node

ENV SRC=Futu_OpenD_7.5.3708_Ubuntu16.04.tar.gz
ADD $SRC /opt
WORKDIR /usr/src/app

RUN  apt-get update \
&&  apt-get install -y curl telnet git-core vim net-tools \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  git clone https://github.com/twhtanghk/futu .

CMD /opt/Futu_OpenD_7.5.3708_Ubuntu16.04/Futu_OpenD_7.5.3708_Ubuntu16.04/FutuOpenD
