include ../../../mk/gnu.pre.mk

DISTNAME=       bison
VERSION=        2.4.2
CATEGORIES=     devel
HOMEPAGE=       http://www.gnu.org/software/bison/bison.html
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

ifndef BOOTSTRAP
DEPENDS=        "gettext/0.18.1.1 --lib --build-env"
DEPENDS+=	"m4/1.4.15 --build-env"
CONFIGURE_ENV+= LIBS=-lintl
else
CONFIGURE_ARGS= --with-included-gettext
endif

DESCRIPTION=    "Bison is a general-purpose parser generator that converts a"
DESCRIPTION+=   "grammar description for an LALR context-free grammar into a"
DESCRIPTION+=   "C program to parse that grammar. Once you are proficient with"
DESCRIPTION+=   "Bison, you can use it to develop a wide range of language"
DESCRIPTION+=   "parsers, from those used in simple desk calculators to"
DESCRIPTION+=   "complex programming languages."

include ../../../mk/gnu.post.mk
