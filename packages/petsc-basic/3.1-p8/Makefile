include ../../../mk/gnu.pre.mk

DISTNAME=	petsc-basic
VERSION=	3.1-p8
PKGFILENAME=    petsc-$(VERSION)
PKGSUBDIR=      petsc-$(VERSION)
CATEGORIES=	numerical
MAINTAINER=     darach@tchpc.tcd.ie
HOMEPAGE=	http://www.mcs.anl.gov/petsc/petsc-as/
MASTER_SITES=	http://ftp.mcs.anl.gov/pub/petsc/release-snapshots
HAS_CONFIGURE = yes
CONFIGURE_SCRIPT = ./configure

DESCRIPTION= "PETSc, pronounced PET-see (the S is silent), is a suite	\
of data structures and routines for the scalable (parallel) solution	\
of scientific applications modeled by partial differential equations "

##DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

MODULEFILE_CONFLICTS += petsc-directsolve

## I want to make things more complicated so: BLAS configuration!!
CPRT_PETSC_BLAS?=mkl

ifeq ("$(CPRT_PETSC_BLAS)","atlas")
DEPENDS+="atlas/3.8.3 --lib --build-env"
CONFIGURE_ARGS +=  --with-blas-lapack-dir=$(PREFIX_atlas)
endif
ifeq ("$(CPRT_PETSC_BLAS)","mkl")
DEPENDS+="l_mkl_p/10.2.2.025 --lib --build-env"
CONFIGURE_ARGS +=  --with-blas-lapack-dir=$(PREFIX_l_mkl_p)
endif
ifeq ("$(CPRT_PETSC_BLAS)","acml")
DEPENDS+="acml-nosmp/4-4-0 --lib --build-env"
CONFIGURE_ARGS +=  --with-blas-lapack-dir=$(PREFIX_acml-nosmp)
endif

$(info BLAS: CPRT_PETSC_BLAS: $(CPRT_PETSC_BLAS); DEPEND: $(DEPENDS))

DEPENDS+="openmpi/1.4.3 --lib --build-env --run-env"
DEPENDS+="ParMetis/3.1.1_openmpi_1.4.3 --lib --build-env"

CPRT_PETSC_LDFLAGS =  

CPRT_PETSC_DEBUG ?= debug
CPRT_PETSC_OPTS+=--with-debugging=$(strip $(if $(findstring nodebug,$(CPRT_PETSC_DEBUG)),no, yes))
CPRT_PETSC_DBG+=$(strip $(if $(findstring nodebug,$(CPRT_PETSC_DEBUG)),opt,debug))

CPRT_PETSC_SCALAR ?= real
CPRT_PETSC_OPTS+=--with-scalar-type=$(strip $(if $(findstring real,$(CPRT_PETSC_SCALAR)),real,complex))

CPRT_PETSC_C_STR ?= c
CPRT_PETSC_CCOMP ?= c
ifeq ("$(CPRT_PETSC_CCOMP)","cxx")
DEPENDS+="boost/1_43_0_openmpi_1.4.3 --lib --build-env"
CPRT_PETSC_OPTS+=  --with-clanguage=C++
CPRT_PETSC_OPTS+= --with-boost=1 --with-boost-dir=$(PREFIX_boost)
CPRT_PETSC_C_STR=cxx
CPRT_PETSC_OPTS+=$(strip $(if $(findstring intel, $(COMPILERS)),--CXXFLAGS=" -shared-intel ",))
else
CPRT_PETSC_OPTS+= --with-clanguage=C
CPRT_PETSC_OPTS+=$(strip $(if $(findstring intel, $(COMPILERS)),--CFLAGS=" -shared-intel ",))
endif

$(warning opt string  $(CPRT_PETSC_OPTS))
$(warning deps  $(DEPENDS))
$(warning debug: $(CPRT_PETSC_DEBUG))
$(warning scalar: $(CPRT_PETSC_SCALAR))
$(warning petsc dbgstr: $(CPRT_PETSC_DBG))
$(warning petsc arch: $(PETSC_ARCH))
$(warning petsc c str: $(CPRT_PETSC_C_STR))
$(warning petsc c comp: $(CPRT_PETSC_CCOMP))

EXTRAVERSION= _$(CPRT_PETSC_DEBUG)-$(CPRT_PETSC_SCALAR)-$(CPRT_PETSC_CCOMP)-$(CPRT_PETSC_BLAS)
WORKDIRSUFFIX= $(CPRT_PETSC_DEBUG)-$(CPRT_PETSC_SCALAR)-$(CPRT_PETSC_CCOMP)-$(CPRT_PETSC_BLAS)-$(COMPILERS)

CONFIGURE_ARGS +=   $(CPRT_PETSC_OPTS)

#CONFIGURE_ARGS +=   $(CPRT_PETSC_OPTS) --LDFLAGS="$(CPRT_PETSC_LDFLAGS)"
CONFIGURE_ARGS +=   --prefix=$(PROGRAM_PREFIX)
CONFIGURE_ARGS +=   --with-shared=1
CONFIGURE_ARGS +=   --with-precision=double
CONFIGURE_ARGS +=  --with-parmetis=1 --with-parmetis-include=$(PREFIX_ParMetis)/include 
CONFIGURE_ARGS +=   --with-parmetis-lib="[$(PREFIX_ParMetis)/lib/libparmetis.a,$(PREFIX_ParMetis)/lib/libmetis.a]"
CONFIGURE_ARGS +=   --with-mpi=1 --with-mpi-dir=$(PREFIX_openmpi)

$(warning opt string  $(CONFIGURE_ARGS))

MODULEFILE_LINES+=      PETSC
MODULEFILE_CMD_PETSC?= \
	$(ECHO) "setenv  PETSC_DIR $(PROGRAM_PREFIX)";

## Yes, petsc seems to assign linux-gnu-... to an intel compiler
## compile too -- of course this may change at some point
PETSC_ARCH=$(strip \
	$(if \
	$(or \
	$(findstring gnu, $(COMPILERS)), \
	$(findstring intel, $(COMPILERS)) \
	), \
	linux-gnu-$(CPRT_PETSC_C_STR)-$(CPRT_PETSC_DBG), \
	unknown-petsc-arch))

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	echo "PETSC_RCH"; \
	$(ECHO) $(PETSC_ARCH); \
	env ;\
	$(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	echo "PETSC_ARCH"; \
	$(ECHO) $(PETSC_ARCH); \
	$(MAKE) PETSC_DIR=$(WRKSRC) PETSC_ARCH=$(PETSC_ARCH) all 2>&1 | tee $(WORKDIR)/cportsbuildlog

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	$(ECHO_MSG) "Testing for package $(DISTNAME)-$(VERSION)";			\
	$(ECHO_MSG) "testlogs go into workdirs for $(DISTNAME), since there are multiple workdirs" >> $(WORKDIR)/testlog; \
	cd $(WRKSRC); \
	$(MAKE) PETSC_DIR=$(PROGRAM_PREFIX) test 2>&1 | tee $(WORKDIR)/testlog

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);  \
	cd $(WRKSRC); \
	$(MAKE) PETSC_DIR=$(WRKSRC) PETSC_ARCH=$(PETSC_ARCH) install 2>&1 | tee $(WORKDIR)/cportsinstalllog

include ../../../mk/gnu.post.mk

