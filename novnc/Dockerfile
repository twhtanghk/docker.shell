FROM python

ENV VER=${VER:-master} \
    REPO=https://github.com/novnc/noVNC \
    APP=/usr/src/app

RUN apt-get update \
&&  apt-get install -y git net-tools \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  pip install numpy \
&&  git clone -b $VER $REPO $APP

ADD index.html $APP

WORKDIR $APP

EXPOSE 6080
