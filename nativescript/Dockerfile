FROM silas/openjdk-node

ENV ANDROID_HOME=/usr/local/android-sdk
ENV PATH=${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${PATH}

WORKDIR /root

ADD https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip /tmp/android.zip

RUN mkdir ${ANDROID_HOME} \
&&  (cd ${ANDROID_HOME}; unzip /tmp/android.zip) \
&&  rm /tmp/android.zip \
&&  (yes | sdkmanager --licenses) \
&&  sdkmanager --update \
&&  sdkmanager "tools" "platform-tools" "platforms;android-25" "build-tools;25.0.2" "extras;android;m2repository" "extras;google;m2repository" \
&&  npm install -g nativescript
