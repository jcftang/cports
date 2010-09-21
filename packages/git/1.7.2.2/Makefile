include ../../../mk/gnu.pre.mk

DISTNAME=       git
VERSION=        1.7.2.2
CATEGORIES=     devel
HOMEPAGE=       http://www.git-scm.com
MASTER_SITES=   http://kernel.org/pub/software/scm/git
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2
GNU_CONFIGURE=  yes

DEPENDS+= "openssl/1.0.0a --lib"
DEPENDS+= "zlib/1.2.5 --lib"
DEPENDS+= "libiconv/1.13 --lib"
DEPENDS+= "tcl/8.5.8 --build-env"
DEPENDS+= "tk/8.5.8 --build-env --run-env"
DEPENDS+= "curl/7.21.0 --lib"

CONFIGURE_ARGS+= --with-iconv=$(PREFIX_libiconv)

DESCRIPTION=    "Git is a free & open source, distributed version control system  designed to handle everything from small to very large projects with speed and efficiency."

include ../../../mk/gnu.post.mk

