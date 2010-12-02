include ../../../mk/gnu.pre.mk

DISTNAME=	mpigraph
VERSION=	1.4
CATEGORIES=	utilities
HOMEPAGE=	http://sourceforge.net/projects/mpigraph/
MASTER_SITES=	http://sourceforge.net/projects/mpigraph/files/mpigraph/mpigraph-1.4/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tgz

EXTRAVERSION=

MAKEFILE=	makefile

DEPENDS+=	"openmpi/1.4.2 --build-env --run-env"

DESCRIPTION=    "mpiGraph is designed to inspect the health and scalability of a"
DESCRIPTION+=    "high-performance interconnect while under heavy load. This is useful to"
DESCRIPTION+=    "detect hardware and software problems in a system, such as slow nodes,"
DESCRIPTION+=    "links, switches, or routing contention."

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	$(MKDIR) $(PROGRAM_PREFIX) ;\
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - ) ;

include ../../../mk/gnu.post.mk
