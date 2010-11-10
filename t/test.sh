#!/bin/bash
. ./scripts/wvtest.sh

WVSTART "Tools"
WVPASS wget --version
WVPASS make --version
WVPASS tar --version
WVPASS gunzip --version
WVPASS install-info --version
WVPASS makeinfo --version
WVPASS patch --version

WVSTART "Distro Type"
WVPASSNE "unknown.i386" "$(./scripts/distro.guess)"
WVPASSNE "unknown.x86_64" "$(./scripts/distro.guess)"

#WVSTART "gnu compilers"
#WVPASS gcc --version
#WVPASS g++ --version
#WVPASS gfortran --version
