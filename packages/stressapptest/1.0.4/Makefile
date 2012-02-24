include ../../../mk/gnu.pre.mk

DISTNAME=	stressapptest
VERSION=	1.0.4
HOMEPAGE=	http://code.google.com/p/stressapptest
MASTER_SITES=	http://stressapptest.googlecode.com/files
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES=	$(DISTNAME)-$(VERSION)_autoconf.tar.gz

PKGSUBDIR=$(DISTNAME)-$(VERSION)_autoconf

DEPENDS+=	"libaio/0.3.109 --lib --build-env"

DESCRIPTION="Stressful Application Test (or stressapptest, its unix name) tries to"
DESCRIPTION+="maximize randomized traffic to memory from processor and I/O, with the"
DESCRIPTION+="intent of creating a realistic high load situation in order to test the"
DESCRIPTION+="existing hardware devices in a computer."



CONFIGURE_ARGS+= ""


include ../../../mk/gnu.post.mk
