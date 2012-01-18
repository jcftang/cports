# Define some local global vars here if you wish

#
# Define Compiler suite profiles
#

#$(info COMPILERS is $(COMPILERS))

CPRT_COMPILER_CLASS:=nocompiler
CPRT_COMPILER_CLASS:=$(strip $(if $(findstring intel, $(COMPILERS)),intel,$(CPRT_COMPILER_CLASS)))
CPRT_COMPILER_CLASS:=$(strip $(if $(findstring gnu, $(COMPILERS)),gnu,$(CPRT_COMPILER_CLASS)))
CPRT_COMPILER_CLASS:=$(strip $(if $(findstring open, $(COMPILERS)),open64,$(CPRT_COMPILER_CLASS)))
CPRT_COMPILER_CLASS:=$(strip $(if $(findstring pcc, $(COMPILERS)),pcc,$(CPRT_COMPILER_CLASS)))

#$(info CPRT_COMPILER_CLASS is $(CPRT_COMPILER_CLASS))

## options: atlas, mkl, acml, openblas
CPRT_BLAS?= atlas

$(info CPRT_BLAS: $(CPRT_BLAS))

ifeq (gnu,$(CPRT_COMPILER_CLASS))
ENVIRONMENT+= CC=gcc
ENVIRONMENT+= CXX=g++
ENVIRONMENT+= F77=gfortran
ENVIRONMENT+= F90=gfortran
ENVIRONMENT+= FC=gfortran
COMPILER_VERSION?= $(shell gcc -dumpversion)
ifeq (X$(COMPILER_VERSION),X)
$(error cannot obtain compiler version)
endif
COMPILER_TAG?=-gnu${COMPILER_VERSION}
ifneq ($(COMPILER_TAG),-$(COMPILERS))
$(error "Error compiler mismatch: detected: $(COMPILER_TAG); specified: -$(COMPILERS)")
endif
endif

ifeq (open64,$(CPRT_COMPILER_CLASS))
ENVIRONMENT+= CC=opencc
ENVIRONMENT+= CXX=openCC
ENVIRONMENT+= F77=openf90
ENVIRONMENT+= F90=openf90
ENVIRONMENT+= FC=openf95
COMPILER_VERSION?= $(shell opencc -dumpversion)
ifeq (X$(COMPILER_VERSION),X)
$(error cannot obtain compiler version)
endif
COMPILER_TAG?=-open64${COMPILER_VERSION}
ifneq ($(COMPILER_TAG),-$(COMPILERS))
$(error "Error compiler mismatch: detected: $(COMPILER_TAG); specified: -$(COMPILERS)")
endif
endif

ifeq (intel,$(CPRT_COMPILER_CLASS))
ENVIRONMENT+= CC=icc
ENVIRONMENT+= CXX=icpc
ENVIRONMENT+= F77=ifort
ENVIRONMENT+= F90=ifort
ENVIRONMENT+= FC=ifort
COMPILER_VERSION?= $(shell icc -dumpversion)
ifeq (X$(COMPILER_VERSION), X)
$(error cannot obtain compiler version)
endif
COMPILER_TAG?=-intel${COMPILER_VERSION}
ifneq ($(COMPILER_TAG),-$(COMPILERS))
$(error "Error compiler mismatch: detected: $(COMPILER_TAG); specified: -$(COMPILERS)")
endif
endif

ifeq (pcc,$(CPRT_COMPILER_CLASS))
ENVIRONMENT+= CC=pcc
COMPILER_VERSION?= $(shell pcc --version | awk '{print $$2}' | sed -e s/.RELEASE//g)
ifeq (X$(COMPILER_VERSION), X)
$(error cannot obtain compiler version)
endif
COMPILER_TAG?=-pcc${COMPILER_VERSION}
ifneq ($(COMPILER_TAG),-$(COMPILERS))
$(error "Error compiler mismatch: detected: $(COMPILER_TAG); specified: -$(COMPILERS)")
endif
endif

#$(info ENVIRONMENT: $(ENVIRONMENT))
#$(info COMPILER VERSION  is $(COMPILER_VERSION))
#$(info COMPILER TAG is $(COMPILER_TAG))

