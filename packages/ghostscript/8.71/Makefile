include ../../../mk/gnu.pre.mk

DISTNAME=	ghostscript
VERSION=	8.71
FONTVERSION=	6.0
CATEGORIES=	printing graphics lib
HOMEPAGE=	http://www.cs.wisc.edu/~ghost/
MASTER_SITES=	$(MASTER_SITE_SOURCEFORGE:=$(DISTNAME)/)
MASTER_SITES+=	ftp://ftp.uu.net/graphics/jpeg/
MAINTAINER=	jtang@tchpc.tcd.ie

HAS_CONFIGURE=	yes
GNU_CONFIGURE=	yes

DISTFILES=	ghostscript-$(VERSION).tar.gz
DISTFILES+=	ghostscript-fonts-std-$(FONTVERSION).tar.gz
DISTFILES+=	ghostscript-fonts-other-$(FONTVERSION).tar.gz
EXTRACT_ONLY=	ghostscript-$(VERSION).tar.gz
INSTALL_FILES=	ghostscript-fonts-std-$(FONTVERSION).tar.gz
INSTALL_FILES+=	ghostscript-fonts-other-$(FONTVERSION).tar.gz

#DEPENDS=	"gtk --lib --build-env"
#DEPENDS+=	"glib --lib --build-env"
DEPENDS+=	"libpng/1.2.42 --lib"
DEPENDS+=	"libtiff/3.9.4 --lib"
DEPENDS+=	"libjpeg/6b --lib --build-env"
DEPENDS+=	"zlib/1.2.5 --lib"
DEPENDS+=	"coreutils/8.5 --build-env"

#LINK_PATHS+=	$(PROGRAM_PREFIX)/lib

DESCRIPTION=	"Ghostscript is an interpreter for PostScript and"
DESCRIPTION+=	"Portable Document Format language, with the ability to"
DESCRIPTION+=	"convert these language files to many raster formats,"
DESCRIPTION+=	"view them on displays, and print them on printers that"
DESCRIPTION+=	"don't have PostScript language capability built in."

CONFIGURE_ARGS+= --with-x 
#CONFIGURE_ARGS+= --disable-cups --with-x 

do-extract: do-extrac%
	$(QUIET) $(MKDIR) $(WRKSRC)/obj
	$(QUIET) $(MKDIR) $(WRKSRC)/bin

do-install: do-instal%
	cd $(PROGRAM_PREFIX) && \
	for i in $(INSTALL_FILES); do \
		$(GZCAT) $(_DISTDIR)/$$i | $(TAR_EXTRACT); \
	done
#	$(LN) -f gsc $(PROGRAM_PREFIX)/bin/gs

include ../../../mk/gnu.post.mk
