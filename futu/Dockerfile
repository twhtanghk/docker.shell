FROM python

ENV SRC=https://softwarefile.futunn.com/FutuOpenD_6.3.2808_NN_Ubuntu16.04.tar.gz

WORKDIR /root

RUN  apt-get update \
&&  apt-get install -y telnet wget git-core vim \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  git clone https://github.com/twhtanghk/futu \
&&  (cd /tmp && wget -q $SRC && tar -C /opt -xf $(basename $SRC))

CMD /opt/FutuOpenD_6.3.2808_NN_Ubuntu16.04/FutuOpenD_6.3.2808_NN_Ubuntu16.04/FutuOpenD

