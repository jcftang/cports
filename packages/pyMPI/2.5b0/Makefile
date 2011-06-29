include ../../../mk/gnu.pre.mk

DISTNAME=       pyMPI
VERSION=        2.5b0
CATEGORIES=     Development
HOMEPAGE=       http://sourceforge.net/projects/pympi/
MASTER_SITES=   http://downloads.sourceforge.net/project/pympi/pyMPI/2.5%20beta/
MAINTAINER=     gmk@caoslinux.org
GNU_CONFIGURE=  yes
DISTFILES=      $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=	"openmpi/1.4.2 --lib --run-env --build-env"
DEPENDS+=	"Python/2.6.5 --lib --run-env --build-env"

CONFIGURE_ARGS+= CFLAGS="-O3" CXXFLAGS="-O3"

DESCRIPTION=    "Distributed Parallel Programming for Python"

include ../../../mk/gnu.post.mk

