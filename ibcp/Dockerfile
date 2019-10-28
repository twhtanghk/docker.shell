FROM openjdk

ENV APP=/root

WORKDIR $APP

RUN curl -SL https://download2.interactivebrokers.com/portal/clientportal.beta.gw.zip |jar xf /dev/stdin \
&&  chmod a+x $APP/bin/run.sh \
&&  yum install -y python-pip hostname \
&&  pip install --upgrade pip \
&&  pip install pyyaml \
&&  yum clean all

ADD init.py /root/bin

EXPOSE 5000

CMD /root/bin/init.py && /root/bin/run.sh /root/root/config.yaml
