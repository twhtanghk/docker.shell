FROM debian

ENV FILE=google-chrome-stable_current_amd64.deb

RUN useradd -ms /bin/bash user \
&&  apt update \
&&  apt install -y wget gnupg libpulse0 \
&&  cd /tmp \
&&  wget -q https://dl.google.com/linux/direct/$FILE \
&&  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
&&  apt install -f -y ./$FILE \
&&  rm -rf /var/lib/apt/lists/* ./$FILE

USER user:user
WORKDIR /home/user

CMD /usr/bin/google-chrome
