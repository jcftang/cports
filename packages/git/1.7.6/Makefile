include ../../../mk/gnu.pre.mk

DISTNAME=       git
VERSION=        1.7.6
CATEGORIES=     devel
HOMEPAGE=       http://www.git-scm.com
MASTER_SITES=   http://kernel.org/pub/software/scm/git
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2
GNU_CONFIGURE=  yes

DEPENDS+= "openssl/1.0.0a --lib --build-env"
DEPENDS+= "zlib/1.2.5 --lib --build-env"
DEPENDS+= "libiconv/1.13 --lib --build-env"
DEPENDS+= "tcl/8.5.8 --build-env --run-env"
DEPENDS+= "tk/8.5.8 --build-env --run-env"
DEPENDS+= "curl/7.21.0 --lib --build-env"

CONFIGURE_ARGS+= --with-iconv=$(PREFIX_libiconv)

DESCRIPTION+=	"Git is a free & open source, distributed version control system  designed"
DESCRIPTION+=	"to handle everything from small to very large projects with speed and"
DESCRIPTION+=	"efficiency."

ifeq ("$(SYSTEM_TYPE)", "powerpc64-SuSE-linux-gnu")
MAKE_FLAGS+=	NO_PYTHON=1
endif

include ../../../mk/gnu.post.mk

