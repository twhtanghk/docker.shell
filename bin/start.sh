#!/bin/sh

for i in smtp oauth2 proxy haproxy aastocks hkexkoa portfolio.vuetify; do
  bin/up $i -d
done
