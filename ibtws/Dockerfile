FROM twhtanghk/chrome

ENV FILE=tws-latest-linux-x64.sh

USER root

RUN apt update \
&&  apt install -y wget libx11-6 libxext6 libxrender1 libxtst6 openjfx \
&&  rm -rf /var/lib/apt/lists/*

USER user:user

RUN cd /tmp \
&&  wget https://download2.interactivebrokers.com/installers/tws/latest/$FILE \
&&  chmod u+x $FILE \
&&  echo n |./$FILE

CMD /home/user/Jts/tws
