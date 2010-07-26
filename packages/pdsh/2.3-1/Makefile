# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=       pdsh
VERSION=        2.3-1
CATEGORIES=     system
HOMEPAGE=       http://llnl.gov/
MASTER_SITES=   ftp://ftp.llnl.gov/pub/linux/pdsh/
MAINTAINER=     gmk@caoslinux.org
GNU_CONFIGURE=  yes
DISTFILES = $(DISTNAME)-$(VERSION).tgz

CONFIGURE_ARGS+= --with-ssh

DESCRIPTION=    "pdsh rocks"

include ../../../mk/gnu.post.mk
