include ../../../mk/gnu.pre.mk

DISTNAME=       gitflow
VERSION=        git
CATEGORIES=     system
HOMEPAGE=       https://github.com/nvie/gitflow
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=
HAS_CONFIGURE=  no

PKGSUBDIR=$(DISTNAME)

DEPENDS+= "Python/2.6.5 --lib --build-env --run-env"
DEPENDS+= "git/1.7.5 --build-env"

DESCRIPTION=    "Git extensions to provide high-level repository operations for Vincent Driessen's branching model."

do-fetch:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR); \
	git clone git://github.com/nvie/$(DISTNAME).git $(DISTNAME)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) prefix=$(PROGRAM_PREFIX); \
	git submodule init; \
	git submodule update

do-install:
	$(MKDIR) $(PROGRAM_PREFIX)
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) prefix=$(PROGRAM_PREFIX) install

include ../../../mk/gnu.post.mk

