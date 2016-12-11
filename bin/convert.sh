#!/bin/bash
vcodec="h264" 
vrate="800" 
acodec="mpga" 
arate="128" 
mux="ts" 
ext="mpg" 

for file in $*; do 
  if ! test -f $file.$ext; then
    /usr/bin/vlc -I dummy "$file" --sout "#transcode{vcodec=$vcodec,vb=$vrate,acodec=$acodec,ab=$arate,channels=2}:standard{mux=$mux,dst=\"$file.$ext\",access=file}" vlc://quit 
  fi
done
