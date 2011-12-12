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

## this should be (so far): acml-nosmp, acml-smp, atlas; anything else will
## probably cause confusion
CPRT_SCLPK_BLAS?=acml-nosmp

ifeq ($(findstring atlas,$(CPRT_SCLPK_BLAS)),atlas)
DEPENDS+="atlas/3.8.3 --lib --build-env"
CPRT_SCLPK_CONFIG_ARGS +=   --blaslib="-lcblas -lf77blas -latlas"
CPRT_SCLPK_CONFIG_ARGS +=   --lapacklib=$(PREFIX_atlas)/lib/liblapack.so
endif
ifeq ($(findstring acml,$(CPRT_SCLPK_BLAS)),acml)
DEPENDS+="$(CPRT_SCLPK_BLAS)/4-4-0 --lib --build-env"
CPRT_SCLPK_CONFIG_ARGS +=   --blaslib="$(PREFIX_acml-nosmp)/lib/libacml.so"
CPRT_SCLPK_CONFIG_ARGS +=  --lapacklib=$(PREFIX_acml-nosmp)/lib/libacml.so
endif
## no mkl for scalapack
#ifeq ("$(CPRT_PETSC_BLAS)","mkl")
#DEPENDS+="l_mkl_p/10.2.2.025 --lib --build-env"
#CPRT_SCLPK_CONFIG_ARGS +=  --with-blas-lapack-dir=$(PREFIX_l_mkl_p)
#endif

EXTRAVERSION=_openmpi_1.4.3-$(CPRT_SCLPK_BLAS)

DEPENDS+="openmpi/1.4.3 --build-env --run-env"

CPRT_SCLPK_CONFIG_ARGS+= --fcflags="-O3 -fPIC" --ccflags="-O3 -fPIC" \
                 --prefix=$(PROGRAM_PREFIX)
CPRT_SCLPK_CONFIG_ARGS+=$(strip $(if $(findstring intel,$(COMPILERS)),--ldflags_c="-nofor-main",))
# icc/ifort specific

$(warning configure args: $(CPRT_SCLPK_CONFIG_ARGS))
$(warning depends $(DEPENDS))

ifndef COMPILERS
COMPILERS?=gnu
endif

DESCRIPTION=	"The ScaLAPACK (or Scalable LAPACK) library includes a subset of LAPACK routines redesigned for distributed memory MIMD parallel computers."

do-configure:
	@

do-build:
	@

do-install:
	mkdir -p $(PROGRAM_PREFIX);
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);                        \
	cd $(WORKDIR); \
	$(ECHO) $(CPRT_SCLPK_CONFIG_ARGS); \
	cd scalapack_installer; \
	python ./setup.py $(CPRT_SCLPK_CONFIG_ARGS);
	cd $(PROGRAM_PREFIX)/lib; \
	cp blacs.a libblacs.a; \
	cp blacsC.a libblacsC.a; \
	cp blacsF77.a libblacsF77.a	


include ../../../mk/gnu.post.mk
