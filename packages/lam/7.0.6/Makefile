# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	lam
VERSION=	7.0.6
CATEGORIES=	development
HOMEPAGE=	http://www.lam-mpi.org/
MASTER_SITES=	http://www.lam-mpi.org/download/files/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION=

CONFIGURE_ARGS+= --without-fc --without-romio --without-profiling --without-mpi2cpp --with-debug

DESCRIPTION=	"Local Area Multicomputer/Message Passing Interface (LAM-MPI)"

include ../../../mk/gnu.post.mk
