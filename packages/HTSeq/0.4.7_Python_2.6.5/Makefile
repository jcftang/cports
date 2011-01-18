include ../../../mk/gnu.pre.mk

DISTNAME=	HTSeq
VERSION=	0.4.7
CATEGORIES=	bio
HOMEPAGE=	http://www-huber.embl.de/users/anders/HTSeq
MASTER_SITES=	http://pypi.python.org/packages/source/H/HTSeq
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.6.5

DEPENDS+=	"atlas/3.8.3 --build-env"
DEPENDS+=	"Python/2.6.5 --build-env --run-env"
DEPENDS+=	"nose/0.11.0_Python_2.6.5 --build-env --run-env" 
DEPENDS+=	"numpy/1.4.1_Python_2.6.5 --build-env --run-env"

DESCRIPTION=	"A framework to process and analyze data from high-throughput sequencing (HTS) assays"

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
