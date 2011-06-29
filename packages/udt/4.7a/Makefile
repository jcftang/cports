include ../../../mk/gnu.pre.mk

DISTNAME=	udt
VERSION=	4.7a
EXTRAVERSION=	
CATEGORIES=	system
HOMEPAGE=	http://sourceforge.net/projects/udt
MASTER_SITES=	http://sourceforge.net/projects/udt/files/udt/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME).sdk.$(VERSION).tar.gz

DESCRIPTION=	"UDT: UDP-based Data Transfer Protocol"
PKGSUBDIR=	$(DISTNAME)4

do-build:
ifeq ("$(SYSTEM_TYPE_CPU)", "x86_64")
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) arch=AMD64
else
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE)
endif

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/lib
	$(INSTALL) -d $(PROGRAM_PREFIX)/include
	cd $(WRKSRC); \
	$(INSTALL) -m 755 src/libudt.a $(PROGRAM_PREFIX)/lib ;\
	$(INSTALL) -m 755 src/libudt.so $(PROGRAM_PREFIX)/lib ;\
	$(INSTALL) -m 644 src/udt.h $(PROGRAM_PREFIX)/include ;\
	cd app && make clean && cd .. ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/app ;\
	cd app && tar -cpf - . | (cd $(PROGRAM_PREFIX)/app && tar -xpf - )  && cd .. ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/doc ;\
	(cd doc && tar -cpf - . | (cd $(PROGRAM_PREFIX)/doc && tar -xpf - )  && cd ..)

include ../../../mk/gnu.post.mk
