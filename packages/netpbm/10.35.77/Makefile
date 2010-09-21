include ../../../mk/gnu.pre.mk

DISTNAME=	netpbm
VERSION=	10.35.77
EXTRAVERSION=	
CATEGORIES=	graphics
HOMEPAGE=	http://sourceforge.net/projects/netpbm/
MASTER_SITES=	http://downloads.sourceforge.net/project/netpbm/super_stable/$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tgz

DESCRIPTION=	"A whole bunch of utilities for primitive manipulation ofgraphic images. Wide array of converters from one graphics format to another."

DEPENDS+=	"flex/2.5.35 --build-env"
DEPENDS+=	"libjpeg/8b --lib --build-env"
DEPENDS+=	"libtiff/3.9.4 --lib --build-env"
DEPENDS+=	"libpng/1.2.39 --lib --build-env"
DEPENDS+=	"libxml2/2.7.7 --lib --build-env"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"

MAKE_FLAGS+= DEFAULT_TARGET=nonmerge 
MAKE_FLAGS+= NETPBMLIBTYPE=unixshared
MAKE_FLAGS+= NETPBMLIBSUFFIX=so
MAKE_FLAGS+= STATICLIB_TOO=y
MAKE_FLAGS+= CFLAGS="-O3 -ffast-math  -pedantic -fno-common -Wall -Wno-uninitialized -Wmissing-declarations -Wimplicit -Wwrite-strings -Wmissing-prototypes -Wundef"
MAKE_FLAGS+= CFLAGS_MERGE="-Wno-missing-declarations -Wno-missing-prototypes"
MAKE_FLAGS+= LDRELOC="ld --reloc"
MAKE_FLAGS+= LINKER_CAN_DO_EXPLICIT_LIBRARY=Y
MAKE_FLAGS+= LINKERISCOMPILER=Y
MAKE_FLAGS+= CFLAGS_SHLIB+=-fPIC
MAKE_FLAGS+= TIFFLIB=libtiff.so
MAKE_FLAGS+= JPEGLIB=libjpeg.so
MAKE_FLAGS+= ZLIB=libz.so
MAKE_FLAGS+= X11LIB=libX11.so
MAKE_FLAGS+= NETPBM_DOCURL="http://netpbm.sourceforge.net/doc/"


do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(CP) Makefile.config.in Makefile.config

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) $(MAKE_FLAGS) 

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) package PKGDIR=$(WRKSRC)/install_root ;\
	cd $(WRKSRC)/install_root ;\
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - )

include ../../../mk/gnu.post.mk
