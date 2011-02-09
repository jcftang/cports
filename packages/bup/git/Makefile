include ../../../mk/gnu.pre.mk

DISTNAME=       bup
VERSION=        git
CATEGORIES=     system
HOMEPAGE=       http://github.com/apenwarr/bup
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=
HAS_CONFIGURE=  no

DO_RUN_TESTS=	yes
TEST_TARGET=	test

PKGSUBDIR=$(DISTNAME)

DEPENDS+= "Python/2.6.5 --lib --build-env --run-env"
DEPENDS+= "git/1.7.2.2 --build-env --run-env"
DEPENDS+= "par2cmdline/0.4 --build-env --run-env"

DESCRIPTION=    "Highly efficient file backup system based on the git packfile format."

MODULEFILE_LINES+=	PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
	$(ECHO)	"prepend-path	PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";

do-fetch:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR); \
	git clone git://github.com/apenwarr/$(DISTNAME).git $(DISTNAME)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) DESTDIR=$(PROGRAM_PREFIX)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) DESTDIR=$(PROGRAM_PREFIX) install
	ln -s $(PROGRAM_PREFIX)/usr/* $(PROGRAM_PREFIX)/

include ../../../mk/gnu.post.mk

