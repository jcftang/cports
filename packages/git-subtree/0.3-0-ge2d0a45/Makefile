include ../../../mk/gnu.pre.mk

DISTNAME=       git-subtree
VERSION=        0.3-0-ge2d0a45
CATEGORIES=     devel
HOMEPAGE=       http://github.com/apenwarr/git-subtree
MASTER_SITES=   http://download.github.com
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	apenwarr-$(DISTNAME)-v$(VERSION).tar.gz
HAS_CONFIGURE=  no

PKGSUBDIR=apenwarr-git-subtree-d553db6
PATCH_STRIP=-p1

DONT_CREATE_METAINFO=yes

DEPENDS+= "git/1.7.6 --build-env --run-env"
#DEPENDS+= "asciidoc/8.6.1 --build-env"
#DEPENDS+= "libxslt/1.1.26 --build-env"

DESCRIPTION=    "An experimental alternative to the git-submodule command. Merges and splits subtrees from your project into subprojects and back."

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) test

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) install-exe

include ../../../mk/gnu.post.mk

