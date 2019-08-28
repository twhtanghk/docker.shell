#!/bin/sh

xhost +

for i in oauth2 proxy aastocks hkexkoa portfolio.vuetify; do
  bin/up $i -d
done
