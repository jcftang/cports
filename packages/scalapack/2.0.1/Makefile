#
# users must download the source manually - this port hasn't been tested
#
include ../../../mk/gnu.pre.mk

DISTNAME=	scalapack
VERSION=	2.0.1
CPRT_SCLPK_INST_VERSION=1.0.1
CATEGORIES=	development
HOMEPAGE=	http://www.netlib.org/scalapack
MASTER_SITES=	http://www.netlib.org/scalapack
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)_installer.tgz $(DISTNAME)-$(VERSION).tgz 

EXTRAVERSION=_openmpi_1.4.5-$(CPRT_SCLPK_BLAS)

## this should be (so far): acml-nosmp, acml-smp, atlas; anything else will
## probably cause confusion
CPRT_SCLPK_BLAS?=$(CPRT_BLAS)

ifeq ($(findstring atlas,$(CPRT_SCLPK_BLAS)),atlas)
DEPENDS+="atlas/3.8.4 --lib --build-env"
CPRT_SCLPK_CONFIG_ARGS +=   --blaslib="-L$(PREFIX_atlas)/lib/ -llapack -lcblas -lf77blas  -latlas"
#CPRT_SCLPK_CONFIG_ARGS +=   --lapacklib="-L$(PREFIX_atlas)/lib -lcblas -lf77blas -ltmg -llapack -latlas"
#CPRT_SCLPK_CONFIG_ARGS +=   --lapacklib=$(PREFIX_atlas)/lib/libatlas.a
endif

ifeq ($(findstring acml,$(CPRT_SCLPK_BLAS)),acml)
$(info using acml blas)
DEPENDS+="acml-nosmp/4-4-0 --lib --build-env --run-env"
$(info prefix: $(PREFIX_acml-nosmp))
#CPRT_SCLPK_CONFIG_ARGS +=   --blaslib="$(PREFIX_acml-nosmp)/lib/libacml.so"
CPRT_SCLPK_CONFIG_ARGS +=  --lapacklib=$(PREFIX_acml-nosmp)/lib/libacml.so
$(info  ---- configure args: $(CPRT_SCLPK_CONFIG_ARGS))
endif
## no mkl for scalapack
#ifeq ("$(CPRT_PETSC_BLAS)","mkl")
#endif

DEPENDS+="openmpi/1.4.5 --build-env --run-env"

CPRT_SCLPK_CONFIG_ARGS+= --fcflags="-O3 -fPIC" --ccflags="-O3 -fPIC" \
                 --prefix=$(PROGRAM_PREFIX)
CPRT_SCLPK_CONFIG_ARGS+=$(strip $(if $(findstring intel,$(COMPILERS)),--ldflags_c="-nofor-main",))
# icc/ifort specific

$(warning configure args: $(CPRT_SCLPK_CONFIG_ARGS))
$(warning depends $(DEPENDS))

ifndef COMPILERS
COMPILERS?=gnu
endif

DESCRIPTION=  "The ScaLAPACK (or Scalable LAPACK) library includes a subset of LAPACK"
DESCRIPTION+= "routines redesigned for distributed memory MIMD parallel computers."

do-configure:
	@

do-build:
	@

do-install:
	mkdir -p $(PROGRAM_PREFIX);
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WORKDIR)/$(DISTNAME)_installer_$(CPRT_SCLPK_INST_VERSION); \
	python setup.py --prefix=$(PROGRAM_PREFIX) $(CPRT_SCLPK_CONFIG_ARGS)
	
include ../../../mk/gnu.post.mk
