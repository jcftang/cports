include ../../../mk/gnu.pre.mk

DISTNAME=	HTSeq
VERSION=	0.5.3p7
CATEGORIES=	bio
HOMEPAGE=	http://www-huber.embl.de/users/anders/HTSeq
MASTER_SITES=	http://pypi.python.org/packages/source/H/HTSeq
MAINTAINER=	neil@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.7.2

DEPENDS+=	"atlas/3.8.3 --build-env"
DEPENDS+=	"Python/2.7.2 --build-env --run-env"
DEPENDS+=	"nose/0.11.3_Python_2.7.2 --build-env --run-env" 
DEPENDS+=	"numpy/1.6.1_Python_2.7.2 --build-env --run-env"
#DEPENDS+=	"pysam/0.6_Python_2.7.2 --build-env --run-env"

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
