FROM debian

ENV VER=${VER:-master} \
    REPO=https://github.com/OpenCPN/OpenCPN \
    APP=/usr/src/app \
    BASEMAP=https://launchpadlibrarian.net/181415653/opencpn-gshhs_2.2.4.orig.tar.xz

ADD $BASEMAP /tmp

RUN useradd -ms /bin/bash user \
&&  apt-get update \
&&  apt-get install -y build-essential cmake gettext git-core libgps-dev wx-common libwxgtk3.0-dev libglu1-mesa-dev libgtk2.0-dev wx3.0-headers libbz2-dev libtinyxml-dev libportaudio2 portaudio19-dev libcurl4-openssl-dev libexpat1-dev libcairo2-dev libwebsockets-dev pulseaudio liblzma-dev \
&&  git clone -b $VER $REPO $APP \
&&  mkdir $APP/build \
&&  (cd $APP/build && cmake ../ && make install) \
&&  tar -C /usr/local/share -xf /tmp/opencpn-gshhs_2.2.4.orig.tar.xz \
&&  rm -rf $APP /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/opencpn-gshhs_2.2.4.orig.tar.xz

USER user:user
WORKDIR /home/user

CMD /usr/local/bin/opencpn
