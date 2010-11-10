#!/bin/bash
. ../scripts/wvtest.sh

WVSTART "Test build of hello package"
(cd ../packages/hello/2.6; make clean; make fetch)
WVPASSRC $?
(cd ../packages/hello/2.6; make extract)
WVPASSRC $?
(cd ../packages/hello/2.6; make configure)
WVPASSRC $?
(cd ../packages/hello/2.6; make build)
WVPASSRC $?
(cd ../packages/hello/2.6; make module)
WVPASSRC $?
(cd ../packages/hello/2.6; make clean)
WVPASSRC $?
