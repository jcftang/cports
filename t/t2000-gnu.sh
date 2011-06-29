#!/bin/bash
. ../scripts/wvtest.sh

# assume default gcc4 (with gfortran and not g77)
WVSTART "GNU compilers"
WVPASS gcc --version
WVPASS g++ --version
WVPASS gfortran --version
