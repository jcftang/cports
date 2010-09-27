include ../../../mk/gnu.pre.mk

DISTNAME=	RDKit
VERSION=	Q32010_1beta1
CATEGORIES=	bio
HOMEPAGE=	http://www.rdkit.org/
MASTER_SITES=	https://sourceforge.net/projects/rdkit/files/rdkit/Q3_2010
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	$(DISTNAME)_$(VERSION).tgz

PKGSUBDIR=	$(DISTNAME)_$(VERSION)
EXTRAVERSION=

#
# need gcc43 or newer to build
#
DEPENDS=	"cmake/2.8.2 --build-env"
DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"
DEPENDS+=	"sqlite/3.6.23.1 --build-env --lib"
DEPENDS+=	"bison/2.4.2 --build-env"
DEPENDS+=	"flex/2.5.35 --build-env"
DEPENDS+=	"boost/1_44_0_openmpi_1.4.2 --build-env --lib"
DEPENDS+=	"numpy/1.4.1_Python_2.6.5 --build-env --run-env"

DESCRIPTION=	"A collection of cheminformatics and machine-learning software written in C++ and Python."

MODULEFILE_LINES+=      PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
        $(ECHO) "prepend-path   PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";


do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	cmake -DRDK_INSTALL_INTREE=0 -DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX) -DBOOST_ROOT=$(PREFIX_boost) -DPYTHON_INCLUDE_DIR=$(PREFIX_Python)/include/python2.6 ../

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE)


include ../../../mk/gnu.post.mk
