include ../../../mk/gnu.pre.mk

## legacy version of db taken from oracle site
## because debian site seems to hold only recent versions

DISTNAME=       db
VERSION=        4.8.30
CATEGORIES=     database
HOMEPAGE=       http://www.oracle.com/technology/software/products/berkeley-db/index.html
MASTER_SITES=   http://download.oracle.com/berkeley-db
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

CONFIGURE_SCRIPT=../dist/configure

PKGSUBDIR=      $(DISTNAME)-$(VERSION)/build_unix

#MENU_CATEGORY= misc
#MENU_COMMANDS= TERMINAL

DESCRIPTION=    "Berkeley DB is a programmatic toolkit that provides fast,"
DESCRIPTION+=   "reliable, scalable, and mission-critical database support"
DESCRIPTION+=   "to software developers."

include ../../../mk/gnu.post.mk

