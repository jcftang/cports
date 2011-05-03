include ../../../mk/gnu.pre.mk

DISTNAME=	jmol
VERSION=	12.0.41
EXTRAVERSION=	
CATEGORIES=	graphics
HOMEPAGE=	http://jmol.sf.net/
MASTER_SITES=	http://sourceforge.net/projects/jmol/files/Jmol/Version%2012.0/Version%20$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = Jmol-$(VERSION)-binary.tar.gz

DESCRIPTION=	"Jmol is a Java molecular viewer for three-dimensional chemical structures."

DEPENDS+=	"jdk/1.6.0_21 --run-env"

do-build:
	#no-op don't need to build this
	@:

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	cd $(WORKDIR); \
	rsync -a  $(PKGSUBDIR)/. $(PROGRAM_PREFIX)/bin/. 

include ../../../mk/gnu.post.mk
