# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	fftw
VERSION=	3.3.2
CATEGORIES=	system
HOMEPAGE=	http://www.fftw.org
MASTER_SITES=	http://www.fftw.org/
MAINTAINER=	paddy@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DESCRIPTION=	"fftw: Discrete Fourier Transform in one or more dimensions, with MPI"

DEPENDS+="openmpi/1.5.3 --build-env --lib openmpi/1.5.3 --run-env --lib"

INSERT_MODULEFILE_CONFLICTS= no


#default version of fftw should be generating doubl precision libraries
FFTW_PRECISION?=double

ifeq ("$(FFTW_PRECISION)","double")
EXTRAVERSION=_mpi
endif

ifeq ("$(FFTW_PRECISION)","long-double")
FFTW_CONF_OPTS= --enable-long-double
EXTRAVERSION=_$(FFTW_PRECISION)_mpi
endif

ifeq ("$(FFTW_PRECISION)","float")
FFTW_CONF_OPTS= --enable-float
EXTRAVERSION=_$(FFTW_PRECISION)_mpi
endif


CONFIGURE_ARGS += --enable-mpi --with-pic --enable-threads $(FFTW_CONF_OPTS)

include ../../../mk/gnu.post.mk
