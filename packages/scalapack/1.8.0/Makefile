#
# users must download the source manually - this port hasn't been tested
#
include ../../../mk/gnu.pre.mk

DISTNAME=	scalapack
VERSION=	1.8.0
CATEGORIES=	development
HOMEPAGE=	http://www.netlib.org/scalapack
MASTER_SITES=	http://www.netlib.org/scalapack
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)_installer.tgz $(DISTNAME)-$(VERSION).tgz 

EXTRAVERSION=_openmpi_1.4.2
DEPENDS+="openmpi/1.4.2 --build-env --run-env"
#DEPENDS+="gcc/4.5.0 --build-env gcc/4.5.0 --run-env"
DEPENDS+="atlas/3.8.3 --build-env --run-env --lib"

CONFIGURE_ARGS+= 

ifndef COMPILERS
COMPILERS?=gnu
endif

DESCRIPTION=	"The ScaLAPACK (or Scalable LAPACK) library includes a subset of LAPACK routines redesigned for distributed memory MIMD parallel computers."

do-configure:
	@

do-build:
# gcc/gfortran, default is the gnu compiler
ifeq ("$(COMPILERS)","gnu")
	mkdir -p $(PROGRAM_PREFIX);
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);                        \
	cd $(WORKDIR); \
	cd scalapack_installer_0.96 ; \
	python ./setup.py \
	--fcflags="-O3 -fPIC" \
	--ccflags="-O3 -fPIC" \
	--downblacs \
	--blaslib="-lcblas -lf77blas -latlas" \
	--lapacklib="$(PREFIX_atlas)/lib/liblapack.so" \
	--prefix=$(PROGRAM_PREFIX)
	
	# rely on atlas for this
	#--downlapack \
	#--f90 mpif90 \
	#--downblas \

endif

# icc/ifort specific
ifeq ("$(COMPILERS)","intel11.0")
	mkdir -p $(PROGRAM_PREFIX);
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);                        \
	cd $(WORKDIR); \
	cd scalapack_installer_0.96 ; \
	python ./setup.py \
	--ldflags_c="-nofor-main" \
	--fcflags="-O3 -fPIC" \
	--ccflags="-O3 -fPIC" \
	--downblacs \
	--blaslib="-lcblas -lf77blas -latlas" \
	--lapacklib="$(PREFIX_atlas)/lib/liblapack.so" \
	--prefix=$(PROGRAM_PREFIX)

endif


do-install:
	@

include ../../../mk/gnu.post.mk
