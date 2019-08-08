FROM circleci/android:api-28-node

ENV NODE_VERSION 12.8.0

WORKDIR /root
USER root

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
&&  . ${HOME}/.nvm/nvm.sh \
&&  npm i nativescript -g --unsafe-perm
