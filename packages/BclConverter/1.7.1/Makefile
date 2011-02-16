include ../../../mk/gnu.pre.mk

DISTNAME=	BclConverter
VERSION=	1.7.1
CATEGORIES=	bio
MASTER_SITES=
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar
HAVE_SOFTWARE=  true

EXTRAVERSION=

DEPENDS+=       "cmake/2.8.2 --build-env"
DEPENDS+=	"boost/1_42_0_openmpi_1.4.2 --build-env --lib"
DEPENDS+=	"bzip2/1.0.6 --build-env --lib"
DEPENDS+=	"zlib/1.2.5 --build-env --lib"
DEPENDS+=	"libxml2/2.7.7  --build-env --lib"
DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"

DESCRIPTION=    "BCL Converter software"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	cmake "-DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX)" \
	"-DBOOST_ROOT=$(PREFIX_boost)" \
	" -DPYTHON_INCLUDE_DIR=$(PREFIX_Python)/include/python2.6" \
	 ../
	#cmake "-DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX)" \
	#../src

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE)

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC)/BUILD; \
	$(MAKE) install ;\
	cd $(WRKSRC); \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - )

include ../../../mk/gnu.post.mk
