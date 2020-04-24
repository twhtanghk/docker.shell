FROM gcc
WORKDIR /root
RUN apt update \
&&  apt install -y qt5-default qttools5-dev-tools libqt5serialport5-dev \
&&  git clone -b grbl_1_1 https://github.com/Denvi/Candle \
&&  (cd Candle/src && qmake && make && cp Candle /usr/local/bin)

FROM debian
WORKDIR /root
COPY --from=0 /root/Candle/src/Candle /usr/local/bin
RUN apt update \
&&  apt install -y libqt5opengl5 libqt5serialport5 \
&&  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
CMD Candle
