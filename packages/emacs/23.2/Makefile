include ../../../mk/gnu.pre.mk

DISTNAME=	emacs
VERSION=	23.2
CATEGORIES=	editor
MAINTAINER=	jtang@tchpc.tcd.ie

HOMEPAGE=	http://www.gnu.org/software/emacs/emacs.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
DISTFILES+=	$(DISTNAME)-$(VERSION).tar.gz
EXTRACT_ONLY+=	$(DISTNAME)-$(VERSION).tar.gz

USAGE_COMMAND=	$(DISTNAME) --help

MENU_CATEGORY=	document
MENU_COMMANDS=	STANDARD XTERM
MENU_COMMAND_MENUTEXT_XTERM=	$(DISTNAME) i en xterm
MENU_COMMAND_CMD_XTERM=		xterm -e $(MENU_COMMAND_CMD_STANDARD) -nw

#CONFIG_SITELISP_DIR?=	/usr/local/share/emacs/site-lisp

MODULELINES=	"prepend-path PATH	$(PROGRAM_PREFIX)/bin"
MODULELINES+=	"prepend-path MANPATH	$(PROGRAM_PREFIX)/man"
MODULELINES+=	"prepend-path INFOPATH	$(PROGRAM_PREFIX)/info"

#EMACS_MODULES=	auctex w3 lyskom gnus mailcrypt
#MODULELINES+=	"module use		$(PROGRAM_PREFIX)/modulefiles"


DEPENDS+=	"binutils/2.20 --build-env"
DEPENDS+=	"texinfo/4.13 --build-env"
DEPENDS+=	"libungif/4.1.4 --lib --build-env"
DEPENDS+=	"fontconfig/2.8.0 --lib --build-env"
DEPENDS+=	"libjpeg/8b --lib --build-env"
DEPENDS+=	"libpng/1.4.3 --lib --build-env"
DEPENDS+=	"libtiff/3.9.4 --lib --build-env"
DEPENDS+=	"libXpm/3.5.8 --lib --build-env"
DEPENDS+=	"ncurses/5.7 --lib --build-env"
DEPENDS+=	"libXaw/1.0.7 --lib --build-env"
DEPENDS+=	"a2ps/4.14 --run-env --build-env"
DEPENDS+=	"pixman/0.18.2 --build-env --lib"
DEPENDS+=	"coreutils/8.5 --build-env"
#if you want gtk the following is the minimum needed, pixman might go here as well
DEPENDS+=	"gtk+/2.20.1 --build-env --lib"
DEPENDS+=	"atk/1.30.0 --build-env --lib"
DEPENDS+=	"glib/2.24.1 --build-env --lib"
DEPENDS+=	"pango/1.28.1 --build-env --lib"
DEPENDS+=	"cairo/1.8.10 --build-env --lib"

# Should be in mailcrypt
#DEPENDS+=	"gnupg --build-env --run-env"
# End Should be in mailcrypt

GNU_CONFIGURE=	yes

ENVIRONMENT+=	LD_LIBRARY_PATH="${PREFIX_ncurses}"

#CONFIGURE_ARGS+=--with-jpeg=${PREFIX_libjpeg}
#CONFIGURE_ARGS+=--with-png=${PREFIX_libpng}
#CONFIGURE_ARGS+=--with-tiff=${PREFIX_libtiff}
#CONFIGURE_ARGS+=--with-xpm=${PREFIX_libxpm}
CONFIGURE_ARGS+= --with-x-toolkit=gtk

DESCRIPTION=	"Emacs is an extensible, customizable real-time display editor"
DESCRIPTION+=	"and computing environment. It offers true Lisp, smoothly"
DESCRIPTION+=	"integrated into the editor, for writing extensions and"
DESCRIPTION+=	"provides an interface to the X Window System."

#do-build: do-buil%
#	(cd $(WRKSRC)/lisp && $(MAKE) recompile)

# haven't included any modules yet
#include ../../../mk/prg.emacs.mk
include ../../../mk/gnu.post.mk
