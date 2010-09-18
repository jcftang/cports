#!/bin/bash

for i in debug nodebug;
do
    for k in c cxx;
    do
	for j in real complex;
	do
	    for l in build install clean;
	    do
		echo make CPRT_PETSC_DEBUG=$i CPRT_PETSC_SCALAR=$j CPRT_PETSC_CCOMP=$k $l $@
	    done
	done
    done
done
