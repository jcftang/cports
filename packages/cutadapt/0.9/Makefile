include ../../../mk/gnu.pre.mk

DISTNAME=	cutadapt
VERSION=	0.9
CATEGORIES=	bio
HOMEPAGE=	http://code.google.com/p/cutadapt
MASTER_SITES=	http://cutadapt.googlecode.com/files
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.6.5

DEPENDS+=	"Python/2.6.5 --build-env --run-env"

DESCRIPTION=	"cutadapt is used to remove adapter sequences from high-throughput sequencing data. This is usually necessary when the read length of the sequencing machine is longer than the molecule that is sequenced, for example when sequencing microRNAs."

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
