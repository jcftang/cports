include ../../../mk/gnu.pre.mk

DISTNAME=	psutils
VERSION=	p17
CATEGORIES=	printing
HOMEPAGE=	http://www.tardis.ed.ac.uk/~ajcd/psutils/
MASTER_SITES=	ftp://ftp.tardis.ed.ac.uk/users/ajcd/
MASTER_SITES+=	ftp://ftp.knackered.org/pub/psutils
DISTFILES=	$(DISTNAME)-$(VERSION)$(EXTRACT_SUFX)
PKGNAME=	psutils
MAINTAINER=	mpkg@e.kth.se

DEPENDS+=	"coreutils/8.5 --build-env" perl

PRECREATE_DIRS=	man/man1 bin

DESCRIPTION=	"Psutils is a tool suite for mainpulating PostScript files."

$(WRKSRC)/Makefile.config:
	echo  >$(WRKSRC)/Makefile.config PREFIX=$(PROGRAM_PREFIX)
	echo >>$(WRKSRC)/Makefile.config PREFIX_perl=$(PREFIX_perl)

do-configure: $(WRKSRC)/Makefile.config
	cat $(WRKSRC)/Makefile.config $(WRKSRC)/Makefile.unix \
	> $(WRKSRC)/Makefile

include ../../../mk/gnu.post.mk
