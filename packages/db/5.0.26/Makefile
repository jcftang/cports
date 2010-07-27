include ../../../mk/gnu.pre.mk

# download distfile from debian mirrors as its more convenient than to
# figure out how to get it from oracle

DISTNAME=       db
VERSION=        5.0.26
CATEGORIES=     database
HOMEPAGE=       http://www.oracle.com/technology/software/products/berkeley-db/index.html
MASTER_SITES=   http://ftp.debian.org/debian/pool/main/d/db
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes
DISTFILES=	$(DISTNAME)_$(VERSION).orig.tar.gz

CONFIGURE_SCRIPT=../dist/configure

PKGSUBDIR=      $(DISTNAME)-$(VERSION)/build_unix

#MENU_CATEGORY= misc
#MENU_COMMANDS= TERMINAL

DESCRIPTION=    "Berkeley DB is a programmatic toolkit that provides fast,"
DESCRIPTION+=   "reliable, scalable, and mission-critical database support"
DESCRIPTION+=   "to software developers."

include ../../../mk/gnu.post.mk

