include ../../../mk/gnu.pre.mk

DISTNAME=	libgcrypt
VERSION=	1.4.6
HOMEPAGE=	http://www.gnupg.org/
MASTER_SITES=	http://ftp.heanet.ie/mirrors/ftp.gnupg.org/gcrypt/libgcrypt
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes

#Commented out, because it will try to use the db-1.85-compat mode of db,
#which wont work if you have /usr/lib/libdb1.*
DEPENDS+="libgpg-error/1.9 --build-env"

DESCRIPTION=	"Libgcrypt is GNU's basic cryptographic library."

CONFIGURE_ARGS+=

include ../../../mk/gnu.post.mk
