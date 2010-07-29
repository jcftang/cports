include ../../../mk/gnu.pre.mk

ICONVOPT?= base

ifeq ("$(ICONVOPT)","iconv")
OPT=  --without-libiconv-prefix
else
OPT= --without-libintl-prefix
endif

$(warning OPT $(OPT))

DISTNAME=       hello
EXTRAVERSION=   
VERSION=        2.6
CATEGORIES=     test
HOMEPAGE=       http://www.gnu.org/software/hello/
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     darach@tchpc.tcd.ie
GNU_CONFIGURE=  yes
CONFIGURE_ARGS +=  $(OPT)
DESCRIPTION=    "The GNU Hello program produces a familiar, friendly greeting."

include ../../../mk/gnu.post.mk



