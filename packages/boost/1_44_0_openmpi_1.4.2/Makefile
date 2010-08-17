include ../../../mk/gnu.pre.mk

DISTNAME=	boost
VERSION=	1_44_0
CATEGORIES=	library
HOMEPAGE=	http://www.boost.org/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/boost/boost/1.44.0
HAS_CONFIGURE = no
DISTFILES = $(DISTNAME)_$(VERSION).tar.bz2

EXTRAVERSION=_openmpi_1.4.2

DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env"
DEPENDS+="Python/2.6.5 --build-env Python/2.6.5 --run-env "

DESCRIPTION=	"Boost provides free peer-reviewed portable C++ source libraries."

#CONFIGURE_ARGS +=

do-configure:
	@
do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd work/$(DISTNAME)_$(VERSION); \
	./bootstrap.sh --with-libraries=all --prefix=$(PROGRAM_PREFIX); \
	echo 'using mpi ;' >> ./tools/build/v2/user-config.jam; \
	./bjam;
	
do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd work/$(DISTNAME)_$(VERSION); \
        ./bjam install;
	
include ../../../mk/gnu.post.mk


