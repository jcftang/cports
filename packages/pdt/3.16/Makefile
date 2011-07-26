## Note information on compiling on aix/powerpc architectures
## in pdtoolkit-README
##

include ../../../mk/gnu.pre.mk

DISTNAME=	pdt
VERSION=	3.16
HOMEPAGE=	http://www.cs.uoregon.edu/research/pdt/home.php
MASTER_SITES=	http://tau.uoregon.edu
MAINTAINER=	darach@tchpc.tcd.ie
HAS_CONFIGURE=	yes
GNU_CONFIGURE=	no
DISTFILES = $(DISTNAME).tgz

PKGSUBDIR=pdtoolkit-$(VERSION)

CPRT_PDT_SYSTEM_ARCH:=noarch
CPRT_PDT_SYSTEM_ARCH:=$(strip $(if $(findstring x86_64,$(SYSTEM_TYPE_CPU)),x86_64,$(CPRT_PDT_SYSTEM_ARCH)))

DEPENDS+=	

DESCRIPTION+=   "Many tasks in an integrated programming environment require access to program information for their implementation. Program Database Toolkit (PDT) is a framework for analyzing source code written in several programming languages and for making rich program knowledge accessible to developers of static and dynamic analysis tools."


do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	./configure --prefix=$(PROGRAM_PREFIX)
do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC); \
	make all;

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC)/; \
	make install; \
	cd ..; \
	$(MKDIR) $(PROGRAM_PREFIX); \
	cp -r $(WRKSRC)/* $(PROGRAM_PREFIX); \
	cd $(PROGRAM_PREFIX)/$(CPRT_PDT_SYSTEM_ARCH); \
	if [ -e ./include ]; then rm -f ./include;fi; \
	ln -s $(PROGRAM_PREFIX)/include .

include ../../../mk/gnu.post.mk




#	$(CP) -r $(CPRT_PDT_SYSTEM_ARCH)/bin $(PROGRAM_PREFIX); \
#	$(CP) -r $(WRKSRC)/include $(PROGRAM_PREFIX); \
#	$(CP) -r $(CPRT_PDT_SYSTEM_ARCH)/lib $(PROGRAM_PREFIX); 
#	
