include ../../../mk/gnu.pre.mk

DISTNAME=       bup
VERSION=        0.19-0-gbab7b16
CATEGORIES=     system
HOMEPAGE=       http://github.com/apenwarr/bup
MASTER_SITES=	http://github.com/apenwarr/bup/tarball/bup-0.19
MASTER_SITES+=   http://download.github.com
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	apenwarr-$(DISTNAME)-$(DISTNAME)-$(VERSION).tar.gz
HAS_CONFIGURE=  no

PKGSUBDIR=apenwarr-bup-dc07789

DEPENDS+= "Python/2.6.5 --lib --build-env --run-env"
DEPENDS+= "git/1.7.2.2 --build-env --run-env"
DEPENDS+= "par2cmdline/0.4 --build-env --run-env"

DESCRIPTION=    "Highly efficient file backup system based on the git packfile format."

MODULEFILE_LINES+=	PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
	$(ECHO)	"prepend-path	PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) DESTDIR=$(PROGRAM_PREFIX) all

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) DESTDIR=$(PROGRAM_PREFIX) install
	ln -s $(PROGRAM_PREFIX)/usr/* $(PROGRAM_PREFIX)/

include ../../../mk/gnu.post.mk

