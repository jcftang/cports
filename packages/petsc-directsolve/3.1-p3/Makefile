include ../../../mk/gnu.pre.mk

DISTNAME=	petsc-directsolve
VERSION=	3.1-p3
PKGFILENAME=    petsc-$(VERSION)
PKGSUBDIR=      petsc-$(VERSION)
CATEGORIES=	numerical
MAINTAINER=     darach@tchpc.tcd.ie
HOMEPAGE=	http://www.mcs.anl.gov/petsc/petsc-as/
MASTER_SITES=	http://ftp.mcs.anl.gov/pub/petsc/release-snapshots
HAS_CONFIGURE = yes
CONFIGURE_SCRIPT = ./configure

MODULEFILE_CONFLICTS += petsc-basic

CPRT_PETSC_BLAS?= atlas

ifeq ("$(CPRT_PETSC_BLAS)","atlas")
DEPENDS+="atlas/3.8.3 --lib --build-env"
endif
ifeq ("$(CPRT_PETSC_BLAS)","mkl")
DEPENDS+="mkl/11111 --lib --build-env"
endif

DEPENDS+="atlas/3.8.3 --lib --build-env"
DEPENDS+="openmpi/1.4.2 --lib --build-env"
DEPENDS+="openmpi/1.4.2 --run-env"
DEPENDS+="ParMetis/3.1.1 --lib --build-env"
DEPENDS+="scalapack/1.8.0_openmpi_1.4.2 --lib --build-env"
DEPENDS+="superlu_dist/2.4 --build-env --lib"
DEPENDS+="zlib/1.2.5  --build-env --lib"

$(info BLAS: CPRT_PETSC_BLAS: $(CPRT_PETSC_BLAS); DEPEND: $(DEPENDS))

CPRT_PETSC_LDFLAGS = 

CPRT_PETSC_DEBUG ?= debug
ifeq ("$(CPRT_PETSC_DEBUG)","nodebug")
CPRT_PETSC_OPTS+= --with-debugging=no
CPRT_PETSC_DBG_STR=opt
else
CPRT_PETSC_OPTS+= --with-debugging=yes
CPRT_PETSC_DBG_STR=debug
endif

CPRT_PETSC_SCALAR ?= real
ifeq ("$(CPRT_PETSC_SCALAR)","complex")
CPRT_PETSC_OPTS+= --with-scalar-type=complex
## scotch doesn't bleedin' work with complex numbers
DEPENDS+="MUMPS/4.9.2_parmetis_3.1.1  --build-env --lib"
else
CPRT_PETSC_OPTS+= --with-scalar-type=real
## scotch doesn't bleedin' work with complex numbers
DEPENDS+="scotch/5.1.9_esmumps  --build-env --lib"
DEPENDS+="MUMPS/4.9.2_scotch_5.1.9  --build-env --lib"
CPRT_PETSC_OPTS+= --with-scotch=1
CPRT_PETSC_OPTS+= --with-scotch-include=$(PREFIX_scotch)/include
CPRT_PETSC_OPTS+= --with-scotch-lib="[$(PREFIX_scotch)/lib/libptesmumps.so,$(PREFIX_scotch)/lib/libptscotch.so,$(PREFIX_scotch)/lib/libptscotcherr.so]"
CPRT_PETSC_LDFLAGS += -L$(PREFIX_scotch)/lib -lptesmumps -lptscotch -lptscotcherr -lz
endif

CPRT_PETSC_LDFLAGS += $(PREFIX_scalapack)/lib/blacs.a 

CPRT_PETSC_C_STR ?= c
CPRT_PETSC_CCOMP ?= c
ifeq ("$(CPRT_PETSC_CCOMP)","cxx")
DEPENDS+="boost/1_43_0_openmpi_1.4.2 --lib --build-env"
CPRT_PETSC_OPTS+=  --with-clanguage=C++ 
CPRT_PETSC_OPTS+= --with-boost=1 --with-boost-dir=$(PREFIX_boost)
CPRT_PETSC_C_STR=cxx
ifeq ("$(COMPILERS)","intel10.1")
CPRT_PETSC_OPTS+= --CXXFLAGS=" -shared-intel "
endif
else
CPRT_PETSC_OPTS+= --with-clanguage=C
endif

$(warning debug: $(CPRT_PETSC_DEBUG))
$(warning scalar: $(CPRT_PETSC_SCALAR))
$(warning petsc arch: $(CPRT_PETSC_DBG_STR))
$(warning petsc arch: $(CPRT_PETSC_C_STR))
$(warning petsc c comp: $(CPRT_PETSC_CCOMP))

EXTRAVERSION= _$(CPRT_PETSC_DEBUG)-$(CPRT_PETSC_SCALAR)-$(CPRT_PETSC_CCOMP)-$(CPRT_PETSC_BLAS)
WORKDIRSUFFIX= $(CPRT_PETSC_DEBUG)-$(CPRT_PETSC_SCALAR)-$(CPRT_PETSC_CCOMP)-$(CPRT_PETSC_BLAS)-$(COMPILERS)

DESCRIPTION=  "PETSc, pronounced PET-see (the S is silent), is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations "

CONFIGURE_ARGS +=   $(CPRT_PETSC_OPTS) --LDFLAGS="$(CPRT_PETSC_LDFLAGS)"
CONFIGURE_ARGS +=   --prefix=$(PROGRAM_PREFIX)
CONFIGURE_ARGS +=   --with-shared=1
CONFIGURE_ARGS +=   --with-precision=double
CONFIGURE_ARGS +=  --with-blas-lapack-dir=$(PREFIX_atlas)
CONFIGURE_ARGS +=  --with-parmetis=1 --with-parmetis-include=$(PREFIX_ParMetis)/include 
CONFIGURE_ARGS +=   --with-parmetis-lib="[$(PREFIX_ParMetis)/lib/libparmetis.a,$(PREFIX_ParMetis)/lib/libmetis.a]"
CONFIGURE_ARGS +=   --with-mpi=1 --with-mpi-dir=$(PREFIX_openmpi)
CONFIGURE_ARGS +=   --with-superlu_dist=1 --with-superlu_dist-include=$(PREFIX_superlu_dist)/include
CONFIGURE_ARGS +=   --with-superlu_dist-lib=$(PREFIX_superlu_dist)/lib/libsuperlu_dist_2.4.a
CONFIGURE_ARGS +=   --with-mumps=1 --with-mumps-dir=$(PREFIX_MUMPS)

CONFIGURE_ARGS +=   --with-blacs=1 --with-blacs-include=$(PREFIX_scalapack)
CONFIGURE_ARGS +=   --with-blacs-lib="[$(PREFIX_scalapack)/lib/blacs.a,$(PREFIX_scalapack)/lib/blacsC.a,$(PREFIX_scalapack)/lib/blacsF77.a,$(PREFIX_scalapack)/lib/blacs.a]"
CONFIGURE_ARGS +=   --with-scalapack=1 --with-scalapack-dir=$(PREFIX_scalapack) 

MODULEFILE_LINES+=      PETSC
MODULEFILE_CMD_PETSC?= \
	$(ECHO) "setenv  PETSC_DIR $(PROGRAM_PREFIX)";

#$(warning modulething is $(MODULEFILE_CMD_PETSC))

## Yes, petsc seems to assign linux-gnu-... to an intel compiler
## compile too -- of course this may change at some point
PETSC_ARCH=$(strip \
	$(if \
	$(or \
	$(findstring gnu, $(COMPILERS)), \
	$(findstring intel, $(COMPILERS)) \
	), \
	linux-gnu-$(CPRT_PETSC_C_STR)-$(CPRT_PETSC_DBG_STR), \
	unknown-petsc-arch))

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(ECHO) $(PETSC_ARCH); \
	env ;\
	$(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(ECHO) $(PETSC_ARCH); \
	$(MAKE) PETSC_DIR=$(WRKSRC) PETSC_ARCH=$(PETSC_ARCH) all 2>&1 | tee cportsmakelog

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	$(ECHO_MSG) "Testing for package $(DISTNAME)-$(VERSION)";			\
	$(ECHO_MSG) "testlogs go into workdirs for $(DISTNAME), since there are multiple workdirs" >> $(CURDIR)/testlog; \
	cd $(WRKSRC); \
	$(MAKE) PETSC_DIR=$(PROGRAM_PREFIX) test 2>&1 | tee ../testlog

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);  \
	cd $(WRKSRC); \
	$(MAKE) PETSC_DIR=$(WRKSRC) PETSC_ARCH=$(PETSC_ARCH) install 2>&1 | tee cportsintsalllog

include ../../../mk/gnu.post.mk

