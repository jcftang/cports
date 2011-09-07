# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	reportlab
VERSION=	2.5
CATEGORIES=	scripting
HOMEPAGE=	http://www.reportlab.com
MASTER_SITES=	http://www.reportlab.com/ftp/	
MAINTAINER=	neil@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.7.2

TDEPEND="Python/2.7.2 --build-env Python/2.7.2 --run-env" 
DEPENDS+=$(TDEPEND)

DESCRIPTION=	" The ReportLab Toolkit is the time-proven, ultra-robust open-source engine for programatically creating PDF documents and forms the foundation of RML "

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
