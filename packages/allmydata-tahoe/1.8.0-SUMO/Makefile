include ../../../mk/gnu.pre.mk

DISTNAME=	allmydata-tahoe
VERSION=	1.8.0-SUMO
CATEGORIES=	system
HOMEPAGE=	http://tahoe-lafs.org/
MASTER_SITES=	http://tahoe-lafs.org/source/tahoe-lafs/releases/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

DEPENDS="Python/2.6.5 --build-env Python/2.6.5 --run-env"
DEPENDS+="openssl/0.9.8o --lib --build-env"
DEPENDS+="gmp/4.3.2 --lib --build-env"

DESCRIPTION=    "Tahoe-LAFS (Least Authority File System) is a Free Software/Open Source"
DESCRIPTION+=    "decentralized data store. It distributes your filesystem across multiple"
DESCRIPTION+=    "servers, and even if some of the servers fail or are taken over by"
DESCRIPTION+=    "an attacker, the entire filesystem continues to work correctly and to"
DESCRIPTION+=    "preserve your privacy and security."

CONFIGURE_ARGS +=

MODULEFILE_LINES+=      PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
        $(ECHO) "prepend-path   PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	$(MKDIR) $(PROGRAM_PREFIX) ;\
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - ) ;\
	cd $(PROGRAM_PREFIX) ;\
	cp -a tahoe-deps ../ ;\
	python setup.py build ;
#	python -c 'import numpy; numpy.show_config(); numpy.test()';

do-test:
	$(MODULE_ADD) $(RUN_DEPENDS) $(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) ; \
	cd $(WRKSRC); \
	python setup.py test

include ../../../mk/gnu.post.mk
