include ../../../mk/gnu.pre.mk

DISTNAME=       conceptual
VERSION=        1.2
CATEGORIES=     benchmarking
HOMEPAGE=       http://sourceforge.net/projects/conceptual/
MASTER_SITES=   http://downloads.sourceforge.net/project/conceptual/conceptual/1.2/
MAINTAINER=     gmk@caoslinux.org
GNU_CONFIGURE=  yes
DISTFILES=      $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O3" CXXFLAGS="-O3"

DEPENDS+=	"openmpi/1.4.2 --build-env --lib --run-env"
DEPENDS+=	"texinfo/4.13 --build-env"
DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"

DESCRIPTION=    "A toolset for rapidly generating portable, readable, and reproducible network-performance tests"

include ../../../mk/gnu.post.mk

