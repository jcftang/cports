include ../../../mk/gnu.pre.mk

DISTNAME=	tetex
VERSION=	3.0
CATEGORIES=	documentation
HOMEPAGE=	http://www.tug.org/teTeX/
MASTER_SITES=	ftp://tug.ctan.org/tex-archive/systems/unix/teTeX/current/distrib/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-src-$(VERSION).tar.gz $(DISTNAME)-texmf-$(VERSION).tar.gz
PKGSUBDIR = $(DISTNAME)-src-$(VERSION)

EXTRAVERSION=

CONFIGURE_ARGS+= --bindir=$(PROGRAM_PREFIX)/bin
CONFIGURE_ARGS+= --disable-multiplatform
CONFIGURE_ARGS+= --with-system-ncurses
CONFIGURE_ARGS+= --with-system-zlib
CONFIGURE_ARGS+= --with-system-pnglib
CONFIGURE_ARGS+= --without-texinfo

DESCRIPTION=	"The TeX text formatting system."

do-configure:
	$(QUIET) mkdir -p $(PROGRAM_PREFIX)/share/texmf
	$(QUIET) tar xzf $(DISTDIR)/$(DISTNAME)/$(DISTNAME)-texmf-$(VERSION).tar.gz -C $(PROGRAM_PREFIX)/share/texmf
	$(QUIET) $(MAKE) do-configura
        

include ../../../mk/gnu.post.mk
