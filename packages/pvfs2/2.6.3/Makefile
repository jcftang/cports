include ../../../mk/gnu.pre.mk

DISTNAME=	pvfs2
VERSION=	2.6.3
CATEGORIES=	clustering
HOMEPAGE=	http://www.pvfs2.org/
MASTER_SITES=	ftp://mirror.anl.gov/pub/pvfs2/ ftp://ftp.parl.clemson.edu/pub/pvfs2/old
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = pvfs-$(VERSION).tar.gz
PKGSUBDIR = pvfs-$(VERSION)

DEPENDS   = "db/5.1.25 --build-env"

HELP_MSG += " > make kmod_install\n"
HELP_MSG += "     Build and update just the kernel module\n"

EXTRAVERSION=

DESCRIPTION=	

KVERSION ?= $(shell uname -r)

CONFIGURE_ARGS += --with-kernel=/lib/modules/$(KVERSION)/build

do-build:	do-buil1
	cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) kmod

do-install:	do-instal1 kmod_install

kmod_install:	do-build
	umask 022 && cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) kmod_install
	depmod -a

include ../../../mk/gnu.post.mk
