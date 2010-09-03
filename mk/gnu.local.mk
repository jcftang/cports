# Define some local global vars here if you wish

#
# Define Compiler suite profiles
#
ifeq (gnu4.5.1,$(COMPILERS))
ENVIRONMENT+= CC=gcc
ENVIRONMENT+= CXX=g++
ENVIRONMENT+= F77=gfortran
ENVIRONMENT+= F90=gfortran
ENVIRONMENT+= FC=gfortran
COMPILER_VERSION?= $(shell gcc -dumpversion)
COMPILER_TAG?=-gnu${COMPILER_VERSION}
ifneq (-gnu4.5.1,$(COMPILER_TAG))
COMPILER_TAG= echo "Error compiler that is loaded up is wrong"
endif
endif


ifeq (gnu4.5.0,$(COMPILERS))
ENVIRONMENT+= CC=gcc
ENVIRONMENT+= CXX=g++
ENVIRONMENT+= F77=gfortran
ENVIRONMENT+= F90=gfortran
ENVIRONMENT+= FC=gfortran
COMPILER_VERSION?= $(shell gcc -dumpversion)
COMPILER_TAG?=-gnu${COMPILER_VERSION}
ifneq (-gnu4.5.0,$(COMPILER_TAG))
COMPILER_TAG= echo "Error compiler that is loaded up is wrong"
endif
endif

ifeq (gnu4.4.0,$(COMPILERS))
ENVIRONMENT+= CC=gcc
ENVIRONMENT+= CXX=g++
ENVIRONMENT+= F77=gfortran
ENVIRONMENT+= F90=gfortran
ENVIRONMENT+= FC=gfortran
COMPILER_VERSION?= $(shell gcc -dumpversion)
COMPILER_TAG?=-gnu${COMPILER_VERSION}
ifneq (-gnu4.4.0,$(COMPILER_TAG))
COMPILER_TAG= echo "Error compiler that is loaded up is wrong"
endif
endif

ifeq (gnu4.4.4,$(COMPILERS))
ENVIRONMENT+= CC=gcc
ENVIRONMENT+= CXX=g++
ENVIRONMENT+= F77=gfortran
ENVIRONMENT+= F90=gfortran
ENVIRONMENT+= FC=gfortran
COMPILER_VERSION?= $(shell gcc -dumpversion)
COMPILER_TAG?=-gnu${COMPILER_VERSION}
ifneq (-gnu4.4.4,$(COMPILER_TAG))
COMPILER_TAG= echo "Error compiler that is loaded up is wrong"
endif
endif

ifeq (open644.2.3,$(COMPILERS))
ENVIRONMENT+= CC=opencc
ENVIRONMENT+= CXX=openCC
ENVIRONMENT+= F77=openf90
ENVIRONMENT+= F90=openf90
ENVIRONMENT+= FC=openf95
COMPILER_VERSION?= $(shell opencc -dumpversion)
COMPILER_TAG?=-open64${COMPILER_VERSION}
ifneq (-open644.2.3,$(COMPILER_TAG))
COMPILER_TAG= echo "Error compiler that is loaded up is wrong"
endif
endif

ifeq (intel11.0,$(COMPILERS))
ENVIRONMENT+= CC=icc
ENVIRONMENT+= CXX=icpc
ENVIRONMENT+= F77=ifort
ENVIRONMENT+= F90=ifort
ENVIRONMENT+= FC=ifort
COMPILER_VERSION?= $(shell icc -dumpversion)
COMPILER_TAG?=-intel${COMPILER_VERSION}
ifneq (-intel11.0,$(COMPILER_TAG))
COMPILER_TAG= echo "Error compiler that is loaded up is wrong"
endif
endif

ifeq (intel10.0,$(COMPILERS))
ENVIRONMENT+= CC=icc
ENVIRONMENT+= CXX=icpc
ENVIRONMENT+= F77=ifort
ENVIRONMENT+= F90=ifort
ENVIRONMENT+= FC=ifort
COMPILER_VERSION?= $(shell icc -dumpversion)
COMPILER_TAG?=-intel${COMPILER_VERSION}
ifneq (-intel10.0,$(COMPILER_TAG))
COMPILER_TAG= echo "Error compiler that is loaded up is wrong"
endif
endif
