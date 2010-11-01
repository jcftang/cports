#
# users must download the source manually - this port hasn't been tested
#
include ../../../mk/gnu.pre.mk

DISTNAME=	open64
VERSION=	4.2.3-0
CATEGORIES=	development
HOMEPAGE=	http://www.open64.net/
MASTER_SITES=	http://downloads.sourceforge.net/project/open64/open64/Open64-4.2.3
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).src.tar.bz2

EXTRAVERSION=

CONFIGURE_ARGS+= 

DEPENDS+=	"flex/2.5.35 --build-env"
DEPENDS+=	"bison/2.4.3 --build-env"
DEPENDS+=	"gettext/0.18.1.1 --build-env --lib"
DEPENDS+=	"libiconv/1.13 --build-env --lib"
DEPENDS+=	"autoconf/2.67 --build-env"
DEPENDS+=	"automake/1.11 --build-env"

DESCRIPTION=	"Open64 is the final result of research contributions from a number"
DESCRIPTION+=	"of compiler groups around the world. Formerly known as Pro64, Open64"
DESCRIPTION+=	"was initially created by SGI and licensed under the GNU Public License"
DESCRIPTION+=	"(GPL v2). It was derived from SGI's MIPSPro compiler."

ifneq ($(SYSTEM_TYPE_CPU), x86_64)
OPEN_TYPE="MACHINE_TYPE=i386"
endif

TOOLROOT=$(PROGRAM_PREFIX)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); make $(OPEN_TYPE) all;\
	cd $(WRKSRC); make $(OPEN_TYPE) library

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); make $(OPEN_TYPE) install TOOLROOT=$(PROGRAM_PREFIX)

include ../../../mk/gnu.post.mk
