include ../../../mk/gnu.pre.mk

# download distfile from debian mirrors as its more convenient than to
# figure out how to get it from oracle

DISTNAME=       topgit
VERSION=        0.8
CATEGORIES=     devel
HOMEPAGE=       http://repo.or.cz/w/topgit.git
MASTER_SITES=   http://ftp.de.debian.org/debian/pool/main/t/topgit
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)_$(VERSION).orig.tar.gz
PKGSUBDIR=      $(DISTNAME)-$(VERSION)
NO_BUILD=	yes
HAS_CONFIGURE=  no

DEPENDS+=	"git/1.7.2.2 --run-env"

DESCRIPTION=    "TopGit manages a patch queue using Git topic branches, one patch per branch. It allows for patch dependencies and can thus manage non-linear patch series."

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/libexec
	$(INSTALL) -d $(PROGRAM_PREFIX)/share
	cd $(WRKSRC) && \
	$(MAKE) install prefix=$(PROGRAM_PREFIX)

include ../../../mk/gnu.post.mk

