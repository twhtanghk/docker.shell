#!/bin/sh

for i in smtp oauth2 proxy aastocks hkexkoa portfolio.vuetify; do
  bin/up $i -d
done
