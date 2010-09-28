include ../../../mk/gnu.pre.mk

DISTNAME=	paraview
VERSION=	3.6.2
CATEGORIES=	graphics
HOMEPAGE=	http://www.paraview.org/
MASTER_SITES=	http://www.paraview.org/files/v3.6
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	$(DISTNAME)-$(VERSION).tar.gz

PKGSUBDIR=	ParaView3
EXTRAVERSION=

DEPENDS=	"cmake/2.8.2 --build-env"
DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"
DEPENDS+=	"tcl/8.5.8 --build-env --lib --run-env"
DEPENDS+=	"tk/8.5.8 --build-env --lib --run-env"
DEPENDS+=	"qt/4.3.5 --build-env --lib"

DESCRIPTION=	"ParaView is an open-source, multi-platform data analysis and visualization application. ParaView users can quickly build visualizations to analyze their data using qualitative and quantitative techniques."

MODULEFILE_LINES+=      PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
        $(ECHO) "prepend-path   PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";


do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	cmake -DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX) \
	-DVTK_USE_RPATH=on \
	-DBUILD_SHARED_LIBS=on \
	-DVTK_WRAP_TCL=on \
	-DVTK_WRAP_PYTHON=on \
	-DPYTHON_INCLUDE_DIR=$(PREFIX_Python)/include/python2.6 \
	-DPYTHON_LIB_DIR=$(PREFIX_Python)/lib \
	-DPYTHON_LIBRARY=$(PREFIX_Python)/lib/libpython2.6.so \
	../

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE) install

include ../../../mk/gnu.post.mk
