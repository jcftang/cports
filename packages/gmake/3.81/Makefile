include ../../../mk/gnu.pre.mk

DISTNAME=	gmake
VERSION=	3.81
PKGNAME=	make-$(VERSION)
CATEGORIES=	devel
HOMEPAGE=	http://www.gnu.org/software/make/make.html
MASTER_SITES=	$(MASTER_SITE_GNU:=make/)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
#CONFIGURE_ARGS=--program-prefix="g"

ifndef BOOTSTRAP
# Use static libintl
DEPENDS=	"gettext/0.17 --build-env"
INCLUDE_PATHS+=	$(PREFIX_gettext)/include
CONFIGURE_ENV+=	ac_cv_search_gettext="$(PREFIX_gettext)/lib/libintl.a"
endif

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	CC="cc -std1 -w1 -fast"
endif

INFO_FILE=	$(PROGRAM_PREFIX)/info/make.info

DESCRIPTION=	"Make is a tool which controls the generation of executables"
DESCRIPTION+=	"and other non-source files of a program from the program's"
DESCRIPTION+=	"source files. Make gets its knowledge of how to build your"
DESCRIPTION+=	"program from a file called the makefile, which lists each of"
DESCRIPTION+=	"the non-source files and how to compute it from other files."
DESCRIPTION+=	"When you write a program, you should write a makefile for it,"
DESCRIPTION+=	"so that it is possible to use Make to build and install the"
DESCRIPTION+=	"program."

do-install:	do-instal%
	$(LN) -f make $(PROGRAM_PREFIX)/bin/gmake
	$(ECHO) ".so man1/make.1" > $(PROGRAM_PREFIX)/man/man1/gmake.1

include ../../../mk/gnu.post.mk
