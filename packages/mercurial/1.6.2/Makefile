include ../../../mk/gnu.pre.mk

DISTNAME=       mercurial
VERSION=        1.6.2
CATEGORIES=     devel
HOMEPAGE=       http://mercurial.selenic.com
MASTER_SITES=   http://mercurial.selenic.com/release
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.gz
HAS_CONFIGURE=  no

DEPENDS+= "Python/2.6.5 --lib --build-env --run-env"

DESCRIPTION=    "Mercurial is a free, distributed source control management tool. It"
DESCRIPTION+=   "efficiently handles projects of any size and offers an easy and intuitive"
DESCRIPTION+=   "interface."

MODULEFILE_LINES+=	PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
	$(ECHO)	"prepend-path	PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) PREFIX=$(PROGRAM_PREFIX) all

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) PREFIX=$(PROGRAM_PREFIX) install

include ../../../mk/gnu.post.mk

