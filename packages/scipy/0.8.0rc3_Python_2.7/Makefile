# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	scipy
VERSION=	0.8.0rc3
CATEGORIES=	scripting
HOMEPAGE=	http://numpy.scipy.org/ 
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/scipy/scipy/0.8.0rc3/
MAINTAINER=	darach@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.7

DEPENDS+="atlas/3.8.3 --build-env"
DEPENDS+="Python/2.7 --build-env Python/2.7 --run-env" 
DEPENDS+="numpy/1.4.1_Python_2.7 --build-env"
DEPENDS+="numpy/1.4.1_Python_2.7 --run-env"

DESCRIPTION=	"scipy is a numerical module associated with python"

CONFIGURE_ARGS +=

do-configure:
	@

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	python setup.py build --fcompiler=gnu95; 

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	python setup.py install  --home=$(PROGRAM_PREFIX);
#	python -c 'import scipy; scipy.show_config(); scipy.test()'

include ../../../mk/gnu.post.mk
