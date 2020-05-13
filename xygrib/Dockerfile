FROM debian

RUN apt-get update \
&&  apt-get install -y xygrib \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

CMD XyGrib
