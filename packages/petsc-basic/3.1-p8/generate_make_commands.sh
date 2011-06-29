#!/bin/bash

for a in atlas mkl
do
    for i in debug nodebug;
    do
	    for j in real complex;
	do
	for k in c cxx;
	    do
    		for l in build install clean;
		do
		    echo make CPRT_PETSC_DEBUG=$i CPRT_PETSC_SCALAR=$j CPRT_PETSC_CCOMP=$k CPRT_PETSC_BLAS=$a $l $@
		done
                echo ""
	    done
            echo ""
	done
        echo ""
    done
    echo ""
done
