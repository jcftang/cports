include ../../../mk/gnu.pre.mk

DISTNAME=	Botan
VERSION=	1.8.9
CATEGORIES=	crypto
HOMEPAGE=	http://botan.randombit.net
MASTER_SITES=	http://botan.randombit.net/files
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tgz

DEPENDS += "boost/1_44_0_openmpi_1.4.2 --lib --build-env"
DEPENDS += "zlib/1.2.5 --lib --build-env"
DEPENDS += "mpc/0.8.2 --lib --build-env"
DEPENDS += "openssl/1.0.0a --lib --build-env"

EXTRAVERSION=

DESCRIPTION=	"Botan, a friendly C++ crypto library"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	./configure.py --prefix=$(PROGRAM_PREFIX) \
	 --with-openssl \
	--with-gnump \
	--with-bzip2 \
	--with-zlib 


include ../../../mk/gnu.post.mk
