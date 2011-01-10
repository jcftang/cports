include ../../../mk/gnu.pre.mk

DISTNAME=	boost
VERSION=	1_41_0
CATEGORIES=	library
HOMEPAGE=	http://www.boost.org/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/boost/boost/1.41.0
HAS_CONFIGURE = no
DISTFILES = $(DISTNAME)_$(VERSION).tar.bz2

EXTRAVERSION=_openmpi_1.4.2

DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env"
DEPENDS+="Python/2.6.5 --build-env Python/2.6.5 --run-env "
DEPENDS+="bzip2/1.0.6 --build-env --lib "
DEPENDS+="zlib/1.2.5 --build-env --lib "

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

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);			\
	$(ECHO_MSG) "Tzesting for package $(DISTNAME)-$(VERSION)";			\
	$(ECHO_MSG) "Haven't figured out how to run boost tests..." 2>&1 | tee  $(CURDIR)/testlog
#	cd work/$(DISTNAME)_$(VERSION) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(TEST_TARGET) 2>&1 | tee $(CURDIR)/testlog

include ../../../mk/gnu.post.mk



