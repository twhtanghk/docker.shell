FROM marcelmaatkamp/pybombs-gnuradio-rtlsdr

RUN apt-get update \
&&  . /usr/local/setup_env.sh \
&&  pip install --upgrade pip \
&&  pybombs recipes update \
&&  pybombs install gr-osmosdr gqrx \
&&  rm -rf /var/lib/apt/lists/*
