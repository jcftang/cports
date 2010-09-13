include ../../../mk/gnu.pre.mk

DISTNAME=       gawk
VERSION=        3.1.8
CATEGORIES=     system
HOMEPAGE=       http://www.gnu.org/software/gawk/gawk.html
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

DEPENDS=        "texinfo/4.13 --build-env"
ifndef BOOTSTRAP
DEPENDS+=       "bison/2.4.2 --build-env"
DEPENDS+=       "gettext/0.18.1.1 --lib --build-env"
else
CONFIGURE_ARGS= --with-included-gettext
endif

CONFIGURE_ARGS+=--enable-bitops --enable-non-decimal-data

DESCRIPTION=    "The 'awk' utility interprets a special-purpose programming"
DESCRIPTION+=   "language that makes it possible to handle simple data-"
DESCRIPTION+=   "reformatting jobs with just a few lines of code."

include ../../../mk/gnu.post.mk

