include ../../../mk/gnu.pre.mk

DISTNAME=       vancouvershortr
VERSION=        svn
CATEGORIES=     bio
HOMEPAGE=       http://sourceforge.net/apps/mediawiki/vancouvershortr/
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=
HAS_CONFIGURE=  no

DO_RUN_TESTS=	no
TEST_TARGET=	test

PKGSUBDIR=$(DISTNAME)

DEPENDS+=	"apache-ant/1.8.2 --build-env --run-env"
DEPENDS+=	"jdk/1.6.0_21 --run-env --build-env"

DESCRIPTION=    "Vancouver Short Read Analysis Package"

do-fetch:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR); \
	svn checkout http://vancouvershortr.svn.sourceforge.net/svnroot/vancouvershortr/trunk $(DISTNAME)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	ant buildall

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR); \
	rsync -a --exclude ".svn" $(PKGSUBDIR)/. $(PROGRAM_PREFIX)/.

include ../../../mk/gnu.post.mk

