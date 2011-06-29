# $Id: Makefile,v 1.7 2001/12/12 17:06:36 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=       m4
VERSION=        1.4.14
CATEGORIES=     devel
HOMEPAGE=       http://www.gnu.org/software/m4/m4.html
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

ifndef BOOTSTRAP
DEPENDS=        "gawk/3.1.8 --build-env"
CONFIGURE_ENV+= AWK=$(PREFIX_gawk)/bin/gawk
endif

DESCRIPTION=    "M4 is an implementation of the traditional UNIX macro"
DESCRIPTION+=   "processor. It is mostly SVR4 compatible, although it has"
DESCRIPTION+=   "some extensions. M4 also has builtin functions for including"
DESCRIPTION+=   "files, running shell commands, doing arithmetic, etc."

include ../../../mk/gnu.post.mk

