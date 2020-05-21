FROM python

WORKDIR /usr/src/app

ADD . .

RUN apt update \
&&  apt install -y libgl1-mesa-glx libgl1-mesa-dri python3-pip python3-pyqt5 python3-pyqt5.qtopengl libpng-dev libfreetype6 libfreetype6-dev python3-dev python3-simplejson python3-numpy python3-scipy libgeos-dev python3-shapely python3-rtree python3-tk libspatialindex-dev python3-gdal python3-lxml \
&&  pip install -r requirements.txt \
&&  pip install PyQt5-sip pyqt5 \
&&  rm -rf /var/lib/apt/lists/*

CMD /usr/local/bin/python /usr/src/app/FlatCAM.py

