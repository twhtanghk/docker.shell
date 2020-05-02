FROM debian:bullseye-slim

RUN apt update \
&&  apt install -y kicad kicad-common kicad-libraries kicad-packages3d \
&&  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

CMD kicad
