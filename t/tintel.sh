#!/bin/bash
. ../scripts/wvtest.sh

WVSTART "Intel compilers"
WVPASS icc --version
WVPASS icpc --version
WVPASS ifort --version
