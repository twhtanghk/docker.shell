FROM debian

RUN apt-get update \
&&  apt-get install -y zygrib \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

CMD zyGrib
