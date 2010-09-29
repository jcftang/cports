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
DEPENDS+=	"qt/4.3.5 --build-env --lib --run-env"

DEPENDS+=       "fontconfig/2.8.0 --lib --build-env"
DEPENDS+=       "libjpeg/8b --lib --build-env"
DEPENDS+=       "libpng/1.2.39 --lib --build-env"
DEPENDS+=       "libtiff/3.9.4 --lib --build-env"
DEPENDS+=       "pango/1.28.1 --build-env --lib"
DEPENDS+=       "cairo/1.8.10 --build-env --lib"
DEPENDS+=       "sqlite/3.6.23.1 --build-env --lib"
DEPENDS+=       "freetype/2.4.2 --build-env --lib"
DEPENDS+=       "openssl/0.9.8o --build-env --lib"
DEPENDS+=       "libiconv/1.13 --build-env --lib"
DEPENDS+=       "gettext/0.18.1.1 --build-env --lib"
DEPENDS+=       "zlib/1.2.5 --build-env --lib"
DEPENDS+=       "glib/2.24.1 --build-env --lib"


DESCRIPTION=	"ParaView is an open-source, multi-platform data analysis and visualization application. ParaView users can quickly build visualizations to analyze their data using qualitative and quantitative techniques."

MODULEFILE_LINES+=      PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
        $(ECHO) "prepend-path   PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";

MODULEFILE_CMD_LIBPATH= \
        if $(TEST) -d $(PROGRAM_PREFIX)/lib/paraview-3.6; then \
                $(ECHO) "prepend-path LD_LIBRARY_PATH $(PROGRAM_PREFIX)/lib/paraview-3.6"; \
        fi; \
        if $(TEST) -d $(PROGRAM_PREFIX)/lib/paraview-3.6; then \
                $(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/lib/paraview-3.6"; \
        fi; \
        if $(TEST) -d $(PROGRAM_PREFIX)/lib/paraview-3.6; then \
                $(ECHO) "prepend-path LIBRARY_PATH $(PROGRAM_PREFIX)/lib/paraview-3.6"; \
        fi; \
        if $(TEST) -d $(PROGRAM_PREFIX)/lib/paraview-3.6; then \
                $(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/lib/paraview-3.6"; \
        fi;
MODULEFILE_CMD_INCLUDEPATH= \
        if $(TEST) -d $(PROGRAM_PREFIX)/include/paraview-3.6; then \
                $(ECHO) "prepend-path INCLUDE_PATH $(PROGRAM_PREFIX)/include/paraview-3.6"; \
        fi; \
        if $(TEST) -d $(PROGRAM_PREFIX)/include/paraview-3.6; then \
                $(ECHO) "prepend-path CPLUS_INCLUDE_PATH $(PROGRAM_PREFIX)/include/paraview-3.6"; \
        fi; \
        if $(TEST) -d $(PROGRAM_PREFIX)/include/paraview-3.6; then \
                $(ECHO) "prepend-path C_INCLUDE_PATH $(PROGRAM_PREFIX)/include/paraview-3.6"; \
        fi;

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
