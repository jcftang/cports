include ../../../mk/gnu.pre.mk

DISTNAME=	orangefs
VERSION=	2.8.4
CATEGORIES=	clustering
HOMEPAGE=	http://www.orangefs.org/
MASTER_SITES=	ftp://ftp.parl.clemson.edu/pub/pvfs2/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = orangefs-$(VERSION).tar.gz
PKGSUBDIR = orangefs

DEPENDS=	"db/4.8.30 --build-env"
DEPENDS+=	"bison/2.4.3 --build-env"
DEPENDS+=	"flex/2.5.35 --build-env"

HELP_MSG += " > make kmod_install\n"
HELP_MSG += "     Build and update just the kernel module\n"

EXTRAVERSION=

DESCRIPTION=	"Orange File System is a branch of the Parallel Virtual File System."

KVERSION ?= $(shell uname -r)

CONFIGURE_ARGS += --with-kernel=/lib/modules/$(KVERSION)/build

do-build:	do-buil1
	cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) kmod

#do-install:	do-instal1 kmod_install

kmod_install:	do-build
	umask 022 && cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) kmod_install
	depmod -a

include ../../../mk/gnu.post.mk
