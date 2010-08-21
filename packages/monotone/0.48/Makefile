include ../../../mk/gnu.pre.mk

DISTNAME=	monotone
VERSION=	0.48
CATEGORIES=	devel
HOMEPAGE=	http://monotone.ca/index.php
MASTER_SITES=	http://monotone.ca/downloads/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DEPENDS+=	"boost/1_44_0_openmpi_1.4.2 --build-env --lib"
DEPENDS+=	"Botan/1.8.9 --build-env --lib"
DEPENDS+=	"gettext/0.17 --build-env --lib"
DEPENDS+=	"libiconv/1.13 --build-env --lib"
DEPENDS+=	"lua/5.1.4 --build-env --lib"
DEPENDS+=	"mpc/0.8.2 --lib --build-env"
DEPENDS+= 	"openssl/1.0.0a --lib --build-env"
DEPENDS+=	"pcre/8.10 --build-env --lib"
DEPENDS+=	"zlib/1.2.5 --build-env --lib"
DEPENDS+=	"sqlite/3.6.23.1 --build-env --lib"
DEPENDS+=	"libidn/1.19 --build-env --lib"
DEPENDS+=	"texinfo/4.13 --build-env"

EXTRAVERSION=

DESCRIPTION=	"monotone is a free distributed version control system. It"
DESCRIPTION+=    "provides a simple, single-file transactional version store, with fully"
DESCRIPTION+=    "disconnected operation and an efficient peer-to-peer synchronization"
DESCRIPTION+=    "protocol."

include ../../../mk/gnu.post.mk
