include ../../../mk/gnu.pre.mk

DISTNAME=	cyrus-sasl
VERSION=	2.1.23
CATEGORIES=	lib security
HOMEPAGE=	http://asg.web.cmu.edu/sasl/
MASTER_SITES=	ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

# not including krb4 and krb5 support (krb4 and heimdal)
DEPENDS+=	"db/4.8.26 --lib"
DEPENDS+=	"openssl/1.0.0a --lib"

CONFIGURE_ARGS=	--enable-shared
CONFIGURE_ARGS+=--with-plugindir=$(PROGRAM_PREFIX)/lib/sasl

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ARGS+=--enable-sia
endif
ifneq (,$(findstring linux,$(SYSTEM_TYPE_OS)))
CONFIGURE_ARGS+=--with-pam
endif
ifneq (,$(findstring solaris,$(SYSTEM_TYPE_OS)))
CONFIGURE_ARGS+=--with-pam
endif

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	CC="cc -std1 -w1"
endif

CPP_FLAGS+=	-Ddb_open=__db_open

DESCRIPTION=	"SASL is the Simple Authentication and Security Layer,"
DESCRIPTION+=	"a method for adding authentication support to connection-"
DESCRIPTION+=	"based protocols. To use SASL, a protocol includes a command"
DESCRIPTION+=	"for identifying and authenticating a user to a server and"
DESCRIPTION+=	"for optionally negotiating protection of subsequent protocol"
DESCRIPTION+=	"interactions. If its use is negotiated, a security layer is"
DESCRIPTION+=	"inserted between the protocol and the connection."

include ../../../mk/gnu.post.mk
