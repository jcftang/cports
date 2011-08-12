include ../../../mk/gnu.pre.mk

DISTNAME=       ninja
VERSION=        git
CATEGORIES=     system
HOMEPAGE=       https://github.com/martine/ninja
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=
HAS_CONFIGURE=  no

PKGSUBDIR=$(DISTNAME)

DEPENDS+= "git/1.7.6 --build-env --run-env"

DESCRIPTION=    "a small build system similar to make"

do-fetch:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR); \
	git clone git://github.com/martine/$(DISTNAME).git $(DISTNAME)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	./bootstrap.sh

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin; \
	$(INSTALL) -d $(PROGRAM_PREFIX)/doc; \
	$(INSTALL) -c -m 555 $(WRKSRC)/ninja $(PROGRAM_PREFIX)/bin/ninja
	$(INSTALL) -c -m 444 $(WRKSRC)/doc/manual.asciidoc $(PROGRAM_PREFIX)/doc/manual.asciidoc

include ../../../mk/gnu.post.mk

