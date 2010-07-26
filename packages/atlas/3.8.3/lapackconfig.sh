#!/bin/bash -x

cd work
optflags=$(cat compflags)
rm compflags
mkdir lapackdir
cd lapackdir
wget http://www.netlib.org/lapack/lapack.tgz
tar zxvf lapack.tgz
lapv=$(find . -maxdepth 1 -type d -printf '%f\n' | grep lapack | sed -e 's/^lapack-//')
if [[ $lapv ]]
then
   mv lapack-$lapv lapackinst
else 
   exit 1;
fi
cd lapackinst
cp INSTALL/make.inc.gfortran ./make.inc.tmp
cat make.inc.tmp | sed -e "s/^OPTS[ \t]*=.*/OPTS    = $optflags/" | sed -e 's/^NOOPT[ \t]*=.*/NOOPT    = -O0 -fPIC /' > make.inc
rm make.inc.tmp
make lib



