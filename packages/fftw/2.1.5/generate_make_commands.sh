#!/bin/bash

for k in double float;
do
  for l in build install clean;
    do
    echo make FFTW_PRECISION=$k $l $@
  done
done
