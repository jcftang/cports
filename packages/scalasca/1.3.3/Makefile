include ../../../mk/gnu.pre.mk

DISTNAME=	scalasca
VERSION=	1.3.3
HOMEPAGE=       http://www.scalasca.org/	
MASTER_SITES=	http://www2.fz-juelich.de/zam/datapool/scalasca
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

#DO_RUN_TESTS=yes

ifeq  ("X$(CPRT_PAPI_KERNEL)","Xyes")
$(info papi kernel)
DEPENDS+= "papi/4.1.3  --build-env --lib --run-env"
CPRT_SCALASCA_CONFIGURE_ARGS+= --with-papi=$(PREFIX_papi)
endif

DEPENDS+= "binutils/2.20  --build-env --lib"
DEPENDS+= "openmpi/1.4.3 --build-env --lib --run-env"
DEPENDS+= "qt/4.7.0 --build-env --lib"
DEPENDS+= "pdt/3.16 --build-env --lib"
DEPENDS+= "jdk/1.6.0_26 --build-env --lib"

CPRT_SCALASCA_CONFIGURE_ARGS+= --with-binutils=$(PREFIX_binutils)
CPRT_SCALASCA_CONFIGURE_ARGS+= --with-pdt=$(PREFIX_pdt)
CPRT_SCALASCA_CONFIGURE_ARGS+= --enable-all-mpi-wrappers


DESCRIPTION+=	"Scalasca is a software tool that supports the performance optimization of parallel programs by measuring and analyzing their runtime behavior. The analysis identifies potential performance bottlenecks – in particular those concerning communication and synchronization – and offers guidance in exploring their causes."

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);  \
	cd $(WRKSRC); \
	./configure --prefix=$(PROGRAM_PREFIX) $(CPRT_SCALASCA_CONFIGURE_ARGS); \
	cd build-linux-gomp-openmpi; \
	if [ -e mf.tmp.out ];then rm -f mf.tmp.out;fi;\
	cat Makefile.defs | $(SED) -e 's|^OPTFLAGS.*=|OPTFLAGS= -fPIC |' > mf.tmp.out;\
	mv mf.tmp.out Makefile.defs

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);  \
        cd $(WRKSRC); \
	cd build-linux-gomp-openmpi; \
	make


include ../../../mk/gnu.post.mk
