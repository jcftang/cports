#!/bin/bash

for a in atlas mkl
do
for l in build install clean;
do
    for k in c cxx;
    do
	for j in real complex;
	do
	    for i in debug nodebug;
	    do
		echo make CPRT_PETSC_DEBUG=$i CPRT_PETSC_SCALAR=$j CPRT_PETSC_CCOMP=$k CPRT_PETSC_BLAS=$a $l $@
	    done
	done
    done
done
done
