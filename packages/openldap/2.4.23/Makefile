include ../../../mk/gnu.pre.mk

DISTNAME=	openldap
VERSION=	2.4.23
CATEGORIES=	database network
HOMEPAGE=	http://www.openldap.org/
MASTER_SITES=	ftp://ftp.OpenLDAP.org/pub/OpenLDAP/openldap-release/
DISTFILES=	$(DISTNAME)-$(VERSION).tgz
MAINTAINER=	mpkg@e.kth.se
GNU_CONFIGURE=	yes

#DEPENDS+=	"krb4 --lib"
#DEPENDS+=	"heimdal --lib"
DEPENDS+=	"openssl/1.0.0a --build-env"
DEPENDS+=	"cyrus-sasl/2.1.23 --build-env"
DEPENDS+=	"db/4.8.26 --build-env"

DESCRIPTION=	"OpenLDAP Software is an open source implementation of the"
DESCRIPTION+=	"Lightweight Directory Access Protocol."

include ../../../mk/gnu.post.mk

