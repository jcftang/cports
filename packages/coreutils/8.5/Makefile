include ../../../mk/gnu.pre.mk

DISTNAME=       coreutils
VERSION=        8.5
CATEGORIES=     system
HOMEPAGE=       http://www.gnu.org/software/coreutils/
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

DEPENDS+=       "bison/2.4.2 --build-env"
DEPENDS+=       "gettext/0.18.1.1 --build-env --cond"

CONFIGURE_ARGS= --with-included-gettext

DESCRIPTION=    "The GNU Core Utililities are a set of tools which comprise"
DESCRIPTION+=   "the basic core file manipulation utilities traditionaly"
DESCRIPTION+=   "found on UNIX operating systems."

include ../../../mk/gnu.post.mk

