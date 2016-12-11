#!/bin/bash

function nspace {
  echo $1 |sed 's/ //g'
}

for file in *.ts; do 
  if test "$file" != $(nspace "$file"); then
    mv "$file" $(nspace "$file")
  fi
done
