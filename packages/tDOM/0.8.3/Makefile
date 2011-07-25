include ../../../mk/gnu.pre.mk

DISTNAME=	tDOM
VERSION=	0.8.3
HOMEPAGE=	http://tdom.github.com/
MASTER_SITES=	https://github.com/downloads/tDOM/tdom
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tgz

DEPENDS+= "tcl/8.5.8 --build-env --lib"
DEPENDS+= "tk/8.5.8 --build-env --lib"

#DESCRIPTION+=   "hardware found in most major microprocessors"

CONFIGURE_ARGS+= --with-tcl=$(PREFIX_tcl)/lib


#do-build:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	make
#
#do-test:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#        cd $(WRKSRC); \
#        make test; \
#	make fulltest
#
#do-install:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	make install-all; 
#

include ../../../mk/gnu.post.mk
