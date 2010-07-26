include ../../../mk/gnu.pre.mk

DISTNAME=	readline
VERSION=	6.1
CATEGORIES=	lib
HOMEPAGE=	http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=	jtang@tchpc.tcd.ie
ALL_TARGET=	static shared
INSTALL_TARGET=	install install-shared
GNU_CONFIGURE=	yes

DEPENDS+=	"texinfo --build-env"

DESCRIPTION=	"The GNU Readline library provides a set of functions for use"
DESCRIPTION+=	"by applications that allow users to edit command lines as"
DESCRIPTION+=	"they are typed in. Both Emacs and vi editing modes are"
DESCRIPTION+=	"available. The Readline library includes additional functions"
DESCRIPTION+=	"to maintain a list of previously-entered command lines,"
DESCRIPTION+=	"to recall and perhaps reedit those lines, and perform csh-"
DESCRIPTION+=	"like history expansion on previous commands."

include ../../../mk/gnu.post.mk

