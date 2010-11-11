#!/bin/bash
. ../scripts/wvtest.sh

# assume default gcc4 (with gfortran and not g77)
WVSTART "GNU bootstrap"

# clean
WVSTART "Clean before bootstrap/1.0"
(cd ../packages/bootstrap/1.0; make do-cleaz)
WVPASSRC $?
(cd ../packages/bootstrap/2.0; make do-cleaz)
WVPASSRC $?

#boostrap 1.0
WVSTART "bootstrap/1.0"
(cd ../packages/ncurses/5.7/ && make build)
WVPASSRC $?
(cd ../packages/m4/1.4.14/ && make BOOTSTRAP=yes build)
WVPASSRC $?
(cd ../packages/texinfo/4.13/ && make BOOTSTRAP=yes build)
WVPASSRC $?
(cd ../packages/gmake/3.81/ && make BOOTSTRAP=yes build)
WVPASSRC $?
(cd ../packages/wget/1.9.1/ && make BOOTSTRAP=yes build)
WVPASSRC $?
(cd ../packages/libiconv/1.13/ && make BOOTSTRAP=yes build)
WVPASSRC $?
(cd ../packages/gettext/0.18.1.1/ && make BOOTSTRAP=yes build)
WVPASSRC $?
(cd ../packages/libtool/2.2.10/ && make BOOTSTRAP=yes build)

# clean
WVSTART "Clean before bootstrap/2.0"
(cd ../packages/bootstrap/1.0; make do-cleaz)
WVPASSRC $?
(cd ../packages/bootstrap/2.0; make do-cleaz)
WVPASSRC $?

#bootstrap 2.0
WVSTART "bootstrap/2.0"
(cd ../packages/texinfo/4.13/ && make build)
WVPASSRC $?
(cd ../packages/gmake/3.81/ && make build)
WVPASSRC $?
(cd ../packages/wget/1.9.1/ && make build)
WVPASSRC $?
(cd ../packages/libiconv/1.13/ && make build)
WVPASSRC $?
(cd ../packages/gettext/0.18.1.1/ && make build)
WVPASSRC $?
(cd ../packages/libtool/2.2.10/ && make build)
WVPASSRC $?

