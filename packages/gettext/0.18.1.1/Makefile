include ../../../mk/gnu.pre.mk

DISTNAME=       gettext
VERSION=        0.18.1.1
CATEGORIES=     lib
HOMEPAGE=       http://www.gnu.org/software/gettext/gettext.html
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     mpkg@e.kth.se
GNU_CONFIGURE=  yes

ifndef BOOTSTRAP
DEPENDS+=        "texinfo/4.13 --build-env"
DEPENDS+=       "libiconv --lib"
DEPENDS+=	"gawk --build-env"
endif

CONFIGURE_ARGS= --with-pic
CONFIGURE_ARGS+=--with-included-gettext # :-)
CONFIGURE_ARGS+=--with-libiconv-prefix=$(PREFIX_libiconv)

LINK_PATHS+=    $(PROGRAM_PREFIX)/lib

DESCRIPTION=    "GNU 'gettext' is an important part of the GNU Translation"
DESCRIPTION+=   "Project. This package offers to programmers, translators,"
DESCRIPTION+=   "and even users, a well integrated set of tools and"
DESCRIPTION+=   "documentation. Specifically, the GNU 'gettext' utilities"
DESCRIPTION+=   "are a set of tools that provides a framework to help other"
DESCRIPTION+=   "GNU packages produce multi-lingual messages."


include ../../../mk/gnu.post.mk
