FROM cncjs/cncjs:v1.9.20

RUN apt update \
&&  apt install -y udev socat \
&&  ./node_modules/.bin/electron-rebuild -f -v 2.0.18 --module-dir /dist/cnc/
