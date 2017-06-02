FROM marcelmaatkamp/pybombs-gnuradio-rtlsdr

RUN apt-get update \
&&  apt-get install -y pulseaudio alsa-utils \
&&  rm -rf /var/lib/apt/lists/* \
&&  . /usr/local/setup_env.sh \
&&  pybombs install gr-osmosdr gqrx
