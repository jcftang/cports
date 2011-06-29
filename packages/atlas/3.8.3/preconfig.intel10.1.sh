#!/bin/bash -x
cd work;
mkdir build;
cd build;
../ATLAS/configure -C if ifort -F if '-O2 -fPIC' -C ic icc -F ic '-O2 -fPIC' -Fa alg -fPIC --prefix=$HOME/tmp/thisthat;
rch=$(grep 'ARCH = ' Make.inc  | sed -e 's/.*=[ \t]*//'); echo $rch;
if [[ $rch =~ 'AMD64K10h64SSE3' ]]
then 
    cd ../ATLAS/CONFIG
    wget http://math-atlas.sourceforge.net/fixes/AMD64K10h64SSE3.tgz
    cd ../../build
else
    echo no
fi

fcomp=$(grep 'F77 =' Make.inc  | sed -e 's/.*=[ \t]*//');
if [[ $fcomp =~ 'gfortran' ]] 
then
    echo "gfortran compiler -- fine"
else 
    echo "Should be using gfortran";
#    exit 1;
fi

compflags=$(grep 'F77FLAGS =' Make.inc  | sed -e 's/.* =[ \t]*//'); echo $compflags

echo $compflags > ../compflags

cd ..

rm -rf build

