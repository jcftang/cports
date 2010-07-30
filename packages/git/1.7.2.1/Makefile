include ../../../mk/gnu.pre.mk

# download distfile from debian mirrors as its more convenient than to
# figure out how to get it from oracle

DISTNAME=       git
VERSION=        1.7.2.1
CATEGORIES=     devel
HOMEPAGE=       http://www.git-scm.com
MASTER_SITES=   http://kernel.org/pub/software/scm/git
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2
GNU_CONFIGURE=  yes

DEPENDS+= "openssl/1.0.0a --build-env --run-env"
DEPENDS+= "zlib/1.2.5 --build-env --run-env"
DEPENDS+= "libiconv/1.13 --build-env --run-env"
DEPENDS+= "tcl/8.5.8 --build-env"
DEPENDS+= "tk/8.5.8 --build-env"
DEPENDS+= "curl/7.21.0 --build-env --run-env"

CONFIGURE_ARGS+= --with-iconv=$(PREFIX_libiconv)

DESCRIPTION=    "Git is a free & open source, distributed version control system  designed to handle everything from small to very large projects with speed and efficiency."

include ../../../mk/gnu.post.mk

