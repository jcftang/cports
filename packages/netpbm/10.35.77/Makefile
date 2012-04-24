include ../../../mk/gnu.pre.mk

DISTNAME=	netpbm
VERSION=	10.35.77
EXTRAVERSION=	
CATEGORIES=	graphics
HOMEPAGE=	http://sourceforge.net/projects/netpbm/
#MASTER_SITES=	http://downloads.sourceforge.net/project/netpbm/super_stable/$(VERSION)/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/netpbm/super_stable/$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tgz

DESCRIPTION=	"A whole bunch of utilities for primitive manipulation ofgraphic images. Wide array of converters from one graphics format to another."

DEPENDS+=	"flex/2.5.35 --build-env"
DEPENDS+=	"libjpeg/8b --lib --build-env"
DEPENDS+=	"libtiff/3.9.4 --lib --build-env"
DEPENDS+=	"libpng/1.2.42 --lib --build-env"
DEPENDS+=	"libxml2/2.7.7 --lib --build-env"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"
DEPENDS+=	"ghostscript/8.71 --lib --build-env --run-env"


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
MAKE_FLAGS+= LDFLAGS+=" -L$(PREFIX_zlib)/lib "


do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(CP) Makefile.config.in Makefile.config

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) $(MAKE_FLAGS);\
	$(MKDIR) $(WRKSRC)/install_root/bin; \
	cp -a $(WRKSRC)/converter/other/pnmtops $(WRKSRC)/install_root/bin; \
	cp -a $(WRKSRC)/converter/other/pnmtojpeg $(WRKSRC)/install_root/bin

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) package PKGDIR=$(WORKDIR)/install_root ;\
	cd $(WORKDIR)/install_root ; \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - ); \
	cp $(WRKSRC)/install_root/bin/pnmtops $(PROGRAM_PREFIX)/bin; \
	cp $(WRKSRC)/install_root/bin/pnmtojpeg $(PROGRAM_PREFIX)/bin;

include ../../../mk/gnu.post.mk
