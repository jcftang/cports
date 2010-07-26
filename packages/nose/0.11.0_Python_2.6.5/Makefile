# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	nose
VERSION=	0.11.0
CATEGORIES=	scripting
HOMEPAGE=	http://code.google.com/p/python-nose/
MASTER_SITES=	http://python-nose.googlecode.com/files
MAINTAINER=	darach@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.6.5

TDEPEND="Python/2.6.5 --build-env Python/2.6.5 --run-env" 
DEPENDS+=$(TDEPEND)

DESCRIPTION=	"nose provides an alternate test discovery and running process for unittest, one that is intended to mimic the behavior of py.test as much as is reasonably possible without resorting to too much magic. "

CONFIGURE_ARGS +=

do-configure:
	@

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC);  \
	python setup.py build 

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	echo $(PROGRAM_PREFIX); \
	cd $(WRKSRC); \
	python setup.py install  --home=$(PROGRAM_PREFIX)
	

include ../../../mk/gnu.post.mk
