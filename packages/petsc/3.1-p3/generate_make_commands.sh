#!/bin/bash

for l in " " install clean;
do
    for k in c cxx;
    do
	for j in real complex;
	do
	    for i in debug nodebug;
	    do
		echo make CPRT_PETSC_DEBUG=$i CPRT_PETSC_SCALAR=$j CPRT_PETSC_CCOMP=$k $l
	    done
	done
    done
done
