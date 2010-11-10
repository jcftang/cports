#!/bin/bash
. ../scripts/wvtest.sh

# Test to see if it's linux that we are on and do we expect the distro
WVSTART "Distro Type"
WVPASSEQ "Linux" "$(uname)"
WVPASSNE "unknown.i386" "$(../scripts/distro.guess)"
WVPASSNE "unknown.x86_64" "$(../scripts/distro.guess)"

# assume gnu tools are new enough or that they just exist
WVSTART "Tools"
WVPASS wget --version
WVPASS make --version
WVPASS tar --version
WVPASS gunzip --version
WVPASS install-info --version
WVPASS makeinfo --version
WVPASS patch --version

$(. $MODULESHOME/init/bash; module add)
WVPASSRC $?
