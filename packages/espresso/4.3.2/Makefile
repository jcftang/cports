include ../../../mk/gnu.pre.mk

DISTNAME=       espresso
VERSION=        4.3.2
CATEGORIES=     numerical
HOMEPAGE=       http://www.pwscf.org/
MASTER_SITES=   http://qe-forge.org/frs/download.php/167/espresso-4.3.2.tar.gz
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

CPRT_ESPRESSO_BLAS?=$(CPRT_BLAS)

vnum=$(shell num=$$(echo "$(1)" | sed -e 's/^[A-Za-z]\+\([0-9]\+\..*\)/\1/'); echo $$num)
#vnumt=$(shell num=$$(echo "$(1)" | sed -e 's/^[A-Za-z]\+\([0-9]\+\..*\)/\1/' -e 's/\.//g'); echo $$num)
vnumt=$(shell num=$$(echo "$(1)" | sed -e 's/^[A-Za-z]\+\([0-9]\+\)..*/\1/'); echo $$num)

#WW=$(call vnum,"gnu4.6.21")
#$(info vnum: $(WW))
#
#YY=$(call vnumt,"gnu4.6.21")
#$(info vnumt: $(YY))
#
#vbigger=$(strip $(shell num=$$(echo "$(1)" | sed -e 's/^[A-Za-z]\+\([0-9]\+\..*\)/\1/' -e 's/\.//g'); if [ "$$num" -gt "$(2)" ]; then echo "Y"; else echo "N";fi))
vbigger=$(strip $(shell if [ "$(1)" -ge "$(2)" ]; then echo "Y"; else echo "N";fi))

#OO=$(call vbigger,"1231","110")
#$(info OO: $(OO))

# - If we are using the INTEL compilers try and figure out the version number (10,11,12).
INTEL_MKL_INCLUDED_AFTER_VERSION:=12
ifeq ($(strip $(findstring intel, $(COMPILERS))),intel)
INTEL_COMPILER_VERSION:=$(strip $(if $(findstring intel, $(COMPILERS)),$(call vnumt,$(COMPILERS)),$(INTEL_COMPILER_VERSION)))
endif

# - If we are using ACML for BLAS
ifeq ("$(CPRT_ESPRESSO_BLAS)","acml")
$(info install with acml BLAS)
DEPENDS+="acml-smp/4-4-0 --lib --build-env --run-env"
CONFIGURE_ARGS +=  --with-blas="-L$(PREFIX_acml-smp)/lib -lacml_mp"
CONFIGURE_ARGS +=  --with-lapack="-L$(PREFIX_acml-smp)/lib -lacml_mp"
endif

# - If we are using ATLAS for BLAS
ifeq ("$(CPRT_ESPRESSO_BLAS)","atlas")
$(info install with atlas BLAS)
DEPENDS+="atlas/3.8.4 --lib --build-env"
CONFIGURE_ARGS +=  --with-blas-lapack-dir=$(PREFIX_atlas)
CONFIGURE_ARGS +=  --with-blas="-L$(PREFIX_atlas)/lib -lptf77blas -lpthread -latlas"
CONFIGURE_ARGS +=  --with-lapack="-L$(PREFIX_atlas)/lib -llapack -lptcblas"
endif

# - If we are using INTEL MKL Blass
ifeq ("$(CPRT_ESPRESSO_BLAS)","mkl")
$(info install with mkl BLAS)
$(info INTEL_COMPILER_VERSION : $(INTEL_COMPILER_VERSION))
#$(info vb: $(strip $(call vbigger,$(INTEL_COMPILER_VERSION),"12")))
ifeq ("$(strip $(call vbigger,$(INTEL_COMPILER_VERSION),$(INTEL_MKL_INCLUDED_AFTER_VERSION)))","Y")
$(info NO MKL DEPENDS)
else ifeq ("$(strip $(call vbigger,$(INTEL_COMPILER_VERSION),$(INTEL_MKL_INCLUDED_AFTER_VERSION)))","N")
$(info DEPENDS ON STANDALONE MKL)
DEPENDS+="l_mkl_p/10.2.2.025 --run-env --build-env --lib"
endif
MKL="-L$(MKLROOT)/lib/intel64 -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_blacs_openmpi_lp64 -lpthread -lm"
CONFIGURE_ARGS += BLAS_LIBS=$(MKL)
CONFIGURE_ARGS += LAPACK_LIBS=$(MKL)
CONFIGURE_ARGS += SCALAPACK_LIBS=$(MKL)
endif

$(info CONFIG : $(CONFIGURE_ARGS))

# - Dependancies
DEPENDS+=       "openmpi/1.4.4 --run-env --build-env"


#ifeq ("n","p")
#$(info np)
#else ifeq ("n","s")
#$(info nw)
#else ifeq ("n","z")
#$(info nn)
#else
#$(info ffs)
#endif
#$(info hello : $(call vbigger,$(COMPILERS),"1212"))



clean:
	echo cleaning

#DEPENDS+="l_mkl_p/10.2.2.025 --lib --build-env"
#DEPENDS+="l_mkl/10.3.9.293 --lib --build-env --run-env"
#CONFIGURE_ARGS +=  LDFLAGS="-L$(PREFIX_l_mkl)/mkl/lib/intel64"  --with-blas="-L$(PREFIX_l_mkl)/mkl/lib/intel64 -lmkl_gf_lp64 -lmkl_sequential -lmkl_lapack95_lp64 -lmkl_core"
#CONFIGURE_ARGS +=  --with-lapack
#endif


#DEPENDS+=       "openmpi/1.4.4 --run-env --build-env"
#DEPENDS+=       "scalapack/1.8.0_openmpi_1.4.3 --lib --build-env"
#DEPENDS+=	"fftw/3.2.2 --lib --build-env"
#DEPENDS+=	"atlas/3.8.3 --lib --build-env"


DESCRIPTION=    "ESPRESSO: opEn-Source Package for Research in Electronic Structure, Simulation, and Optimization"
#CONFIGURE_ENV+=	BLAS_LIBS="-lf77blas -lcblas -latlas" LAPACK_LIBS="-llapack"
#MAKE_FLAGS+= 	DFLAGS="-D__GFORTRAN -D__STD_F95 -D__FFTW3 -D__MPI -D__PARA -DEXX"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	./configure --prefix=$(PROGRAM_PREFIX) $(CONFIGURE_ARGS);
	$(SED) -e "s,FFTW,FFTW3," $(WORKDIR)/$(PKGSUBDIR)/make.sys > $(WORKDIR)/$(PKGSUBDIR)/make.sys.tmp;
	$(CP) $(WORKDIR)/$(PKGSUBDIR)/make.sys.tmp $(WORKDIR)/$(PKGSUBDIR)/make.sys


do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -t $(PROGRAM_PREFIX)/bin $(WRKSRC)/bin/*

include ../../../mk/gnu.post.mk

