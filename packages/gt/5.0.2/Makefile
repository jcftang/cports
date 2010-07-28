include ../../../mk/gnu.pre.mk

DISTNAME=	gt
VERSION=	5.0.2
CATEGORIES=	grid
HOMEPAGE=	http://www.globus.org/toolkit
MASTER_SITES=	http://www.globus.org/ftppub/gt5/5.0/5.0.2/installers/src
DISTFILES=	$(DISTNAME)$(VERSION)-all-source-installer.tar.bz2
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

PKGNAME=	$(DISTNAME)$(VERSION)-all-source-installer

DEPENDS+=	"openssl/1.0.0a --build-env"
DEPENDS+=	"zlib/1.2.5 --build-env"
DEPENDS+=	"gawk/3.1.8 --build-env"
DEPENDS+=	"gtar/1.23 --build-env"
DEPENDS+=	"sed/4.2.1 --build-env"

DESCRIPTION=	"The open source Globus® Toolkit is a fundamental enabling technology for"
DESCRIPTION+=	"the Grid, letting people share computing power, databases, and other"
DESCRIPTION+=   "tools securely online across corporate, institutional, and geographic"
DESCRIPTION+=   "boundaries without sacrificing local autonomy. The toolkit includes"
DESCRIPTION+=   "software services and libraries for resource monitoring, discovery,"
DESCRIPTION+=   "and management, plus security and file management. In addition to being"
DESCRIPTION+=   "a central part of science and engineering projects that total nearly a"
DESCRIPTION+=   "half-billion dollars internationally, the Globus Toolkit is a substrate"
DESCRIPTION+=   "on which leading IT companies are building significant commercial Grid"
DESCRIPTION+=   "products."

CONFIGURE_ARGS+= 	--with-buildopts="-verbose"
GLOBUS_LOCATION=	$(PROGRAM_PREFIX)

MODULELINES+=		"setenv		GLOBUS_LOCATION		$(PROGRAM_PREFIX)"

do-buila:
	$(MAKE) 2>&1 | tee build.log
	$(MAKE) do-buil%

include ../../../mk/gnu.post.mk

