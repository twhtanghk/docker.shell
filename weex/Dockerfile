FROM runmymind/docker-android-sdk

WORKDIR /root

ENV NODE_VERSION=9.4.0 \
    ARCH=x64 \
    PATH="/opt/android-sdk-linux/platform-tools:${PATH}"

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
&&  tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
&&  rm -rf node-v$NODE_VERSION-linux-$ARCH.tar.xz \
&&  ln -s /usr/local/bin/node /usr/local/bin/nodejs \
&&  npm install -g weex-toolkit

CMD ['node']
