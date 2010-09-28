include ../../../mk/gnu.pre.mk

DISTNAME=	vtk
VERSION=	5.6.0
CATEGORIES=	development
HOMEPAGE=	http://www.vtk.org/
MASTER_SITES=	http://www.vtk.org/files/release/5.6
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	$(DISTNAME)-$(VERSION).tar.gz

PKGSUBDIR=	VTK
EXTRAVERSION=

DEPENDS=	"cmake/2.8.2 --build-env"
DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"
DEPENDS+=	"tcl/8.5.8 --build-env --lib --run-env"
DEPENDS+=	"tk/8.5.8 --build-env --lib --run-env"

DESCRIPTION=	"The Visualization Toolkit (VTK) is an open-source, freely available software system for 3D computer graphics, image processing and visualization."

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
