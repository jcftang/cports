include ../../../mk/gnu.pre.mk

DISTNAME=       discount
VERSION=        2.0.2
CATEGORIES=     utilities
HOMEPAGE=       http://www.pell.portland.or.us/~orc/Code/discount/
MASTER_SITES=   http://www.pell.portland.or.us/~orc/Code/discount/
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2
HAS_CONFIGURE=  yes

DESCRIPTION=    "Implementation of John Gruber.s Markdown text to html language. There's"
DESCRIPTION+=	"not much here that differentiates it from any of the existing Markdown"
DESCRIPTION+=	"implementations except that it's written in C instead of one of the vast"
DESCRIPTION+=	"flock of scripting languages that are fighting it out for the Perl crown."

CONFIGURE_SCRIPT=	./configure.sh
CONFIGURE_ARGS=		--prefix=$(PROGRAM_PREFIX) --enable-all-features

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/{bin,lib,include}
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	$(MAKE) install.everything; \
	$(MAKE) install.man

include ../../../mk/gnu.post.mk

