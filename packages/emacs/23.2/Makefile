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
DEPENDS+=	"libungif/4.1.4 --lib"
DEPENDS+=	"libjpeg/8b --lib"
DEPENDS+=	"libpng/1.4.1 --lib"
DEPENDS+=	"libtiff/3.9.4 --lib"
DEPENDS+=	"libXpm/3.5.8 --lib"
DEPENDS+=	"ncurses/5.7 --lib"
DEPENDS+=	"libXaw/1.0.7 --lib"
DEPENDS+=	"a2ps/4.14 --run-env --build-env"
DEPENDS+=	"coreutils/8.5 --build-env"

# Should be in mailcrypt
#DEPENDS+=	"gnupg --build-env --run-env"
# End Should be in mailcrypt

GNU_CONFIGURE=	yes

ENVIRONMENT+=	LD_LIBRARY_PATH="${PREFIX_ncurses}"

#CONFIGURE_ARGS+=--with-jpeg=${PREFIX_libjpeg}
#CONFIGURE_ARGS+=--with-png=${PREFIX_libpng}
#CONFIGURE_ARGS+=--with-tiff=${PREFIX_libtiff}
#CONFIGURE_ARGS+=--with-xpm=${PREFIX_libxpm}

DESCRIPTION=	"Emacs is an extensible, customizable real-time display editor"
DESCRIPTION+=	"and computing environment. It offers true Lisp, smoothly"
DESCRIPTION+=	"integrated into the editor, for writing extensions and"
DESCRIPTION+=	"provides an interface to the X Window System."

#do-build: do-buil%
#	(cd $(WRKSRC)/lisp && $(MAKE) recompile)

# haven't included any modules yet
#include ../../../mk/prg.emacs.mk
include ../../../mk/gnu.post.mk
