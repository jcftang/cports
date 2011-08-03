include ../../../mk/gnu.pre.mk

DISTNAME=	tau
VERSION=        2.20.2
HOMEPAGE=	http://www.cs.uoregon.edu/research/tau/home.php
MASTER_SITES=	http://tau.uoregon.edu
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no
#DISTFILES = $(DISTNAME)-$(VERSION).tar.gz
DISTFILES = $(DISTNAME).tgz

CPRT_PAPI_KERNEL=$(strip $(if \
                             $(findstring rhel-6, $(DISTRO_TYPE)), \
                             yes,no))

DEPENDS+= "openmpi/1.4.3 --build-env --lib --run-env"

ifeq  ("X$(CPRT_PAPI_KERNEL)","Xyes")
DEPENDS+= "papi/4.1.3  --build-env --lib"
CPRT_TAU_CONFIGURE_ARGS+= -papi=$(PREFIX_papi) 
endif

DEPENDS+= "pdt/3.16 --build-env --lib"
DEPENDS+= "scalasca/1.3.3 --build-env --lib"
DEPENDS+= "jdk/1.6.0_26 --build-env --lib --run-env"

ifeq  ("X$(CPRT_PAPI_KERNEL)","Xyes")
CPRT_TAU_CONFIGURE_ARGS+= -papi=$(PREFIX_papi)
endif

CPRT_TAU_CONFIGURE_ARGS+= -mpi -mpiinc=$(PREFIX_openmpi)/include -mpilib=$(PREFIX_openmpi)/lib
CPRT_TAU_CONFIGURE_ARGS+= -TRACE
CPRT_TAU_CONFIGURE_ARGS+= -MPITRACE
CPRT_TAU_CONFIGURE_ARGS+= -pdt=$(PREFIX_pdt)
CPRT_TAU_CONFIGURE_ARGS+= -jdk=$(PREFIX_jdk)
CPRT_TAU_CONFIGURE_ARGS+= -scalasca=$(PREFIX_scalasca)
CPRT_TAU_CONFIGURE_ARGS+= -LINUXTIMERS

MODULEFILE_CMD_PATH+= \
        if $(TEST) -d $(PROGRAM_PREFIX)/$(SYSTEM_TYPE_CPU)/bin; then \
                $(ECHO) "prepend-path PATH $(PROGRAM_PREFIX)/$(SYSTEM_TYPE_CPU)/bin"; \
        fi; 

DESCRIPTION+=	"TAU Performance System is a portable profiling and tracing toolkit for performance analysis of parallel programs written in Fortran, C, C++, Java, Python."

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);  \
	cd $(WRKSRC); \
	./configure -prefix=$(PROGRAM_PREFIX) $(CPRT_TAU_CONFIGURE_ARGS)

do-build:
	echo build

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);  \
	cd $(WRKSRC); \
	make install

include ../../../mk/gnu.post.mk
