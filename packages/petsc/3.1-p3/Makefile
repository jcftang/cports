include ../../../mk/gnu.pre.mk

DISTNAME=	petsc
VERSION=	3.1-p3
CATEGORIES=	numerical
HOMEPAGE=	http://www.mcs.anl.gov/petsc/petsc-as/
MASTER_SITES=	http://ftp.mcs.anl.gov/pub/petsc/release-snapshots
HAS_CONFIGURE = yes
CONFIGURE_SCRIPT = ./configure
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DEBUG := debug

#$(warning compilersl is $(findstring gnu,$(COMPILERS)))

EXTRAVERSION=

DEPENDS+="atlas/3.8.3 --build-env"
DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env"
DEPENDS+="ParMetis/3.1.1 --build-env "

DESCRIPTION=  "PETSc, pronounced PET-see (the S is silent), is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations "

CONFIGURE_ARGS +=   --prefix=$(PROGRAM_PREFIX)
CONFIGURE_ARGS +=   --with-shared=1
CONFIGURE_ARGS +=  --with-blas-lapack-dir=$(PREFIX_atlas)
CONFIGURE_ARGS +=  --with-parmetis=1 --with-parmetis-include=$(PREFIX_ParMetis)/include 
CONFIGURE_ARGS +=   --with-parmetis-lib="[$(PREFIX_ParMetis)/lib/libparmetis.a,$(PREFIX_ParMetis)/lib/libmetis.a]"
CONFIGURE_ARGS +=   --with-mpi=1 --with-mpi-dir=$(PREFIX_openmpi)

MODULEFILE_LINES+=      PETSC
MODULEFILE_CMD_PETSC?= \
	$(ECHO) "setenv  PETSC_DIR $(PROGRAM_PREFIX)";

#$(warning modulething is $(MODULEFILE_CMD_PETSC))

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(ECHO) $(PETSC_ARCH); \
	$(MAKE) PETSC_DIR=$(WRKSRC) PETSC_ARCH=$(PETSC_ARCH) all 2>&1 | tee cportsmakelog

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) PETSC_DIR=$(PROGRAM_PREFIX) test 2>&1 | tee cportstestlog

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);  \
	cd $(WRKSRC); \
	$(MAKE) PETSC_DIR=$(WRKSRC) PETSC_ARCH=$(PETSC_ARCH) install 2>&1 | tee cportsintsalllog

include ../../../mk/gnu.post.mk

## If I put this here, it seems to work -- no (real) idea what is
## going on
ifeq "$(COMPILERS)" "gnu"
  PETSC_ARCH=linux-gnu-c-$(DEBUG)
endif

