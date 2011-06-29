include ../../../mk/gnu.pre.mk

DISTNAME=	modules
VERSION=	3.2.7
MAINTAINER=	jtang@tchpc.tcd.ie
HOMEPAGE=	http://modules.sourceforge.net/
MASTER_SITES=	http://downloads.sourceforge.net/project/modules/Modules/modules-$(VERSION)/
DISTFILES=	$(DISTNAME)-$(VERSION)b.tar.gz
GNU_CONFIGURE=	yes

DEPENDS+=	"tcl/8.5.8 --build-env"

ifneq (,$(findstring i386_linux6,$(SYSTYPE)))
CONFIGURE_ENV+=	LIBS="-ldl"
endif

FULL_MODULE_PATH=	$(MODULEDIR)
FULL_MODULE_PATH+=	$(CONFIG_MODULEPATH)
FULL_COLON_MODULE_PATH=	$(shell for foo in $(FULL_MODULE_PATH); do echo $$foo; done | tr '\n' ':'| sed s,:$$,,)

CONFIGURE_ARGS+= --with-tcl-inc=${PREFIX_tcl}/include
CONFIGURE_ARGS+= --with-tcl-lib=${PREFIX_tcl}/lib
CONFIGURE_ARGS+= --with-module-path=$(FULL_COLON_MODULE_PATH)
CONFIGURE_ARGS+= --with-version-path=$(PREFIX)/$(DISTNAME)/$(VERSION)/version
#CONFIGURE_ARGS+= --with-static=yes


include ../../../mk/gnu.post.mk
