include ../../../mk/gnu.pre.mk

DISTNAME=	texinfo
VERSION=	4.13
CATEGORIES=	system
HOMEPAGE=	http://www.gnu.org/software/texinfo/texinfo.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

# Gettext depend on this packet.
DEPENDS=	"gettext/0.18.1.1 --build-env --lib --cond"
DEPENDS+=	"ncurses/5.7 --build-env --lib"

INFO_FILE=	$(PROGRAM_PREFIX)/info/$(DISTNAME)

DESCRIPTION=	"Texinfo is a documentation system that uses a single source"
DESCRIPTION+=	"file to produce both online information and printed output."
DESCRIPTION+=	"This means that instead of writing two different documents,"
DESCRIPTION+=	"one for the online help or other online information and the"
DESCRIPTION+=	"other for a typeset manual or other printed work, you need"
DESCRIPTION+=	"write only one document. When the work is revised, you need"
DESCRIPTION+=	"revise only one document."

include ../../../mk/gnu.post.mk
