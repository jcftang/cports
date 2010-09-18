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
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).src.tar.bz2

EXTRAVERSION=

CONFIGURE_ARGS+= 

DEPENDS+=	"flex/2.5.35 --build-env"
DEPENDS+=	"bison/2.4.3 --build-env"

DESCRIPTION=	"Open64 is the final result of research contributions from a number of compiler groups around the world. Formerly known as Pro64, Open64 was initially created by SGI and licensed under the GNU Public License (GPL v2). It was derived from SGI's MIPSPro compiler."

do-configure:
	@

TOOLROOT=$(PROGRAM_PREFIX)
do-build:
	cd $(WRKSRC); make
	cd $(WRKSRC); make library

do-install:
	cd $(WRKSRC); make install TOOLROOT=$(PROGRAM_PREFIX)

include ../../../mk/gnu.post.mk
