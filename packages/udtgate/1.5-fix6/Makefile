include ../../../mk/gnu.pre.mk

DISTNAME=	udtgate
VERSION=	1.5-fix6
CATEGORIES=	system
HOMEPAGE=	http://sourceforge.net/projects/udtgate/files
MASTER_SITES=	http://sourceforge.net/projects/udtgate/files/udtgate/udtgate-1.5-fix6%20%28beta%29
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=
DEPENDS+=	"udt-gnu/4.2-fix4 --build-env --lib"

CONFIGURE_ARGS+=	--with-udt=$(PREFIX_udt-gnu)

DESCRIPTION=	"UDTGATE - gateway system to pass network application data over high-speed UDT tunnels."

include ../../../mk/gnu.post.mk
