include ../../../mk/gnu.pre.mk

DISTNAME=       gtar
VERSION=        1.23
PKGNAME=        tar-$(VERSION)
CATEGORIES=     system archive
HOMEPAGE=       http://www.gnu.org/software/tar/tar.html
MASTER_SITES=   $(MASTER_SITE_GNU:=tar/)
DISTFILES=      tar-$(VERSION).tar.gz
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

ifndef BOOTSTRAP
DEPENDS+=	"xz/4.999.9beta-180-ge23e --build-env --lib --run-env"
endif

CONFIGURE_ARGS+=--program-prefix="g"
CONFIGURE_ARGS+=--with-included-gettext

INFO_FILE=      $(PROGRAM_PREFIX)/info/tar.info

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+= CC="cc -std1 -w1"
endif

DESCRIPTION=    "The tar program provides the ability to create tar archives,"
DESCRIPTION+=   "as well as various other kinds of manipulation. For example,"
DESCRIPTION+=   "you can use tar on previously created archives to extract"
DESCRIPTION+=   "files, to store additional files, or to update or list files"
DESCRIPTION+=   "which were already stored."

include ../../../mk/gnu.post.mk
