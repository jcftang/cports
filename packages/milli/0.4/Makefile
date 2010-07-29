include ../../../mk/gnu.pre.mk

DISTNAME=	milli
VERSION=	0.4
CATEGORIES=	devel
HOMEPAGE=	http://www.steve.org.uk/Software/milli/
MASTER_SITES=	http://www.steve.org.uk/Software/milli/
MAINTAINER=	jtang@tchpc.tcd.ie
#USE_PERL5=	yes
HAS_CONFIGURE=	no

#DEPENDS=	"perl/5.12.1 --build-env"

DESCRIPTION=	"milli is a simple bug tracking system, written in perl,"
DESCRIPTION+=   "which allows you to store reported bugs within your projects. This makes"
DESCRIPTION+=   "it trivially usable in a distributed fashion."

do-build:
	@:

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -c -m 555 $(WRKSRC)/bin/milli $(PROGRAM_PREFIX)/bin/milli
	$(INSTALL) -d $(PROGRAM_PREFIX)/doc
	$(INSTALL) -c -m 555 $(WRKSRC)/README $(PROGRAM_PREFIX)/doc/README

include ../../../mk/gnu.post.mk

