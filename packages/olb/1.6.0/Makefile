include ../../../mk/gnu.pre.mk

DISTNAME=       OLB
VERSION=        1.6.0
CATEGORIES=     bio
MASTER_SITES=
MAINTAINER=     neil@tchpc.tcd.ie
GNU_CONFIGURE=  no
HAS_CONFIGURE=  no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz
HAVE_SOFTWARE=  true

DESCRIPTION=    "Offline Base Caller"

DEPENDS+=       "cmake/2.8.2 --build-env"
DEPENDS+=       "boost/1_41_0_openmpi_1.4.2 --build-env --lib"
DEPENDS+=	"fftw/3.2.2_float --build-env --lib"
DEPENDS+=	"ImageMagick/6.6.7-1 --build-env --lib --run-env"
DEPENDS+=	"perl/5.12.1 --build-env --lib --run-env"
DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"
DEPENDS+=	"ghostscript/8.71 --build-env --lib --run-env"
DEPENDS+=       "gnuplot/4.4.0 --build-env --lib --run-env"
DEPENDS+=	"bzip2/1.0.6 --build-env --lib --run-env"



do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	mkdir -p $(PROGRAM_PREFIX); \
	cp -r $(WRKSRC)/* $(PROGRAM_PREFIX); \
	cd $(PROGRAM_PREFIX); \
	$(MKDIR) BUILD ; \
	cd BUILD ;\
	BOOST_ROOT=$(PREFIX_boost) cmake ../  

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(PROGRAM_PREFIX); \
	cd BUILD ;\
	$(MAKE)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(PROGRAM_PREFIX); \
	cd BUILD ;\
	$(MAKE) install





include ../../../mk/gnu.post.mk
