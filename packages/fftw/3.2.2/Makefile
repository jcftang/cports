# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	fftw
VERSION=	3.2.2
CATEGORIES=	system
HOMEPAGE=	http://www.fftw.org
MASTER_SITES=	http://www.fftw.org/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DESCRIPTION=	"fftw: Discrete Fourier Transform in one or more dimensions"


#default version of fftw should be generating doubl precision libraries
FFTW_PRECISION?=double

ifeq ("$(FFTW_PRECISION)","double")
EXTRAVERSION=
endif

ifeq ("$(FFTW_PRECISION)","long-double")
FFTW_CONF_OPTS= --enable-long-double
EXTRAVERSION=_$(FFTW_PRECISION)
endif

ifeq ("$(FFTW_PRECISION)","float")
FFTW_CONF_OPTS= --enable-float
EXTRAVERSION=_$(FFTW_PRECISION)
endif


CONFIGURE_ARGS += --with-pic --enable-threads $(FFTW_CONF_OPTS)

include ../../../mk/gnu.post.mk
