# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	biopython
VERSION=	1.58
CATEGORIES=	scripting
HOMEPAGE=	http://biopython.org
MASTER_SITES=	http://biopython.org/DIST/
MAINTAINER=	neil@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.7.2

DEPENDS+="Python/2.7.2 --build-env Python/2.7.2 --run-env"
DEPENDS+="numpy/1.6.1_Python_2.7.2 --build-env numpy/1.6.1_Python_2.7.2 --run-env"
DEPENDS+="reportlab/2.5_Python_2.7.2 --build-env reportlab/2.5_Python_2.7.2 --run-env"

#TDEPEND="Python/2.7.2 --build-env Python/2.7.2 --run-env" 
#DEPENDS+=$(TDEPEND)

DESCRIPTION=	" Biopython is a set of freely available tools for biological computation written in Python " 

CONFIGURE_ARGS +=

do-configure:
	@

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC);  \
	python setup.py build 

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	python setup.py install --home=$(PROGRAM_PREFIX) ;

include ../../../mk/gnu.post.mk
