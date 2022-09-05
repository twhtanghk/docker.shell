FROM debian

ENV SRC=https://softwarefile.futunn.com/FutuOpenD_6.3.2808_NN_Ubuntu16.04.tar.gz

RUN  apt-get update \
&&  apt-get install -y wget libfuse2 librust-gobject-sys-dev libnss3 libgtk-3-0 libx11-xcb-dev libasound2 desktop-file-utils xdg-utils \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  (cd /tmp && wget -q $SRC && tar -C /opt -xf $(basename $SRC))

CMD /opt/FutuOpenD_6.3.2808_NN_Ubuntu16.04/FutuOpenD-GUI_6.3.2808_NN_Ubuntu16.04/FutuOpenD_6.3.2808_Ubuntu16.04.AppImage

WORKDIR /root
