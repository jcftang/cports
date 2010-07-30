include ../../../mk/gnu.pre.mk

DISTNAME=	tcl
VERSION=	8.5.8
MASTER_SITES=	http://downloads.sourceforge.net/project/tcl/Tcl/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HOMEPAGE=	http://www.tcl.tk
DISTFILES=	$(DISTNAME)$(VERSION)-src.tar.gz

PKGFILENAME=	$(DISTNAME)$(VERSION)
PKGSUBDIR?=	$(DISTNAME)$(VERSION)/unix

INSTALL_SOURCE= yes
GNU_CONFIGURE=	yes

DEPENDS=	"zlib/1.2.5 --lib"
DEPENDS+=	"binutils/2.20 --build-env"
BUILD_STATIC=	yes

ifeq ("$(SYSTEM_TYPE)", "x86_64-redhat-linux-gnu")
CONFIGURE_ARGS+=--enable-64bit CFLAGS=-fPIC
endif

do-extract:	do-extrac%
	$(MKDIR) $(WRKSRC)/static $(WRKSRC)/shared

do-configure:
ifeq (yes,$(BUILD_STATIC))
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS) && \
	$(ECHO_MSG) "Configuring package $(DISTNAME)-$(VERSION) (static)" && \
	cd $(WRKSRC)/static && $(CONFIGURE_ENV) $(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS) --enable-static --disable-shared
endif
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS) && \
	$(ECHO_MSG) "Configuring package $(DISTNAME)-$(VERSION) (shared)" && \
	cd $(WRKSRC)/shared && $(CONFIGURE_ENV) $(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS) --enable-shared --disable-static

do-build:
ifeq (yes,$(BUILD_STATIC))
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS) && \
	$(ECHO_MSG) "Building for package $(DISTNAME)-$(VERSION) (static)" && \
	cd $(WRKSRC)/static && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(ALL_TARGET)
endif
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS) && \
	$(ECHO_MSG) "Building for package $(DISTNAME)-$(VERSION) (shared)" && \
	cd $(WRKSRC)/shared && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(ALL_TARGET)

do-install:
ifeq (yes,$(BUILD_STATIC))
	$(QUIET) $(MKDIR) -p $(PROGRAM_PREFIX) && \
	$(MODULE_ADD) $(BUILD_DEPENDS) && umask 022 && \
	$(ECHO_MSG) "Installing package $(DISTNAME)-$(VERSION) (static)" && \
	cd $(WRKSRC)/static && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(INSTALL_TARGET)
endif
	$(QUIET) $(MKDIR) -p $(PROGRAM_PREFIX) && \
	$(MODULE_ADD) $(BUILD_DEPENDS) && umask 022 && \
	$(ECHO_MSG) "Installing package $(DISTNAME)-$(VERSION) (shared)" && \
	cd $(WRKSRC)/shared && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(INSTALL_TARGET) && \
	cd $(PROGRAM_PREFIX)/lib && \
	ln -fs libtcl8.5.so libtcl.so && \
	ln -fs libtcl8.5.so libtcl8.so && \
	ln -fs libtcl8.5.a libtcl.a && \
	ln -fs libtcl8.5.a libtcl8.a && \
	cd $(PROGRAM_PREFIX)/bin && \
	ln -fs tclsh8.5 tclsh

include ../../../mk/gnu.post.mk
