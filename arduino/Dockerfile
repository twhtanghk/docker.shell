FROM debian:unstable

RUN apt update \
&&  apt install -y arduino \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD arduino
