include ../../../mk/gnu.pre.mk

DISTNAME=	gdis
VERSION=	0.90
CATEGORIES=	utilities
HOMEPAGE=	http://sourceforge.net/projects/gdis
MASTER_SITES=	http://downloads.sourceforge.net/project/gdis/gdis/0.90/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION)-src.tgz

EXTRAVERSION=

DEPENDS+=       "atk/1.30.0 --build-env --lib"
DEPENDS+=       "binutils/2.20 --build-env"
DEPENDS+=       "cairo/1.8.10 --build-env --lib"
DEPENDS+=       "coreutils/8.5 --build-env"
DEPENDS+=       "fontconfig/2.8.0 --lib --build-env"
DEPENDS+=	"gd/2.0.36RC1 --build-env --lib"
DEPENDS+=       "glib/2.24.1 --build-env --lib"
DEPENDS+=       "gtk+/2.20.1 --build-env --lib"
DEPENDS+=	"libjpeg/8b --build-env --lib"
DEPENDS+=	"libpng/1.2.42 --build-env --lib"
DEPENDS+=	"libtiff/3.9.4 --build-env --lib"
DEPENDS+=       "libungif/4.1.4 --lib --build-env"
DEPENDS+=       "libXaw/1.0.7 --lib --build-env"
DEPENDS+=       "libXpm/3.5.8 --lib --build-env"
DEPENDS+=       "ncurses/5.7 --lib --build-env"
DEPENDS+=       "netpbm/10.35.77 --build-env --lib"
DEPENDS+=       "pango/1.28.1 --build-env --lib"
DEPENDS+=       "pixman/0.18.2 --build-env --lib"
DEPENDS+=	"poppler/0.14.1 --build-env --lib"
DEPENDS+=       "texinfo/4.13 --build-env"
DEPENDS+=	"gtkglext/1.2.0 --build-env --lib"

DESCRIPTION=	"This is a GTK/OpenGL based program for displaying isolated molecules, periodic systems, and crystalline habits. It also acts as a GUI to packages such as GAMESS, GULP, and POVRay to provide energy minimizations and publication quality rendering."

do-configure:
	@:

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC); \
	echo 1 | ./install

do-install:
	$(MKDIR) $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/gdis $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/gdis.elements $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/gdis.library $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/gdis.manual $(PROGRAM_PREFIX)/bin
	

include ../../../mk/gnu.post.mk
