include ../../../mk/gnu.pre.mk

DISTNAME=	zfec
VERSION=	1.4.22
CATEGORIES=	utilities
HOMEPAGE=	http://tahoe-lafs.org/trac/zfec/wiki
MASTER_SITES=	http://pypi.python.org/packages/source/z/zfec/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.6.5

DEPENDS+=	"Python/2.6.5 --build-env --run-env"

DESCRIPTION=	"a fast erasure codec which can be used with the command-line, C, Python, or Haskell"

CONFIGURE_ARGS +=

do-configure:
	@

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	python setup.py build; 

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	python setup.py install --home=$(PROGRAM_PREFIX); 
#	python -c 'import numpy; numpy.show_config(); numpy.test()';

do-test:
	$(MODULE_ADD) $(RUN_DEPENDS) $(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) ; \
	python -c 'import HTSeq;'; \

include ../../../mk/gnu.post.mk
