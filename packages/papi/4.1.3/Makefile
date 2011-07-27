include ../../../mk/gnu.pre.mk

DISTNAME=	papi
VERSION=	4.1.3
HOMEPAGE=	http://icl.cs.utk.edu/papi/index.html
MASTER_SITES=	http://icl.cs.utk.edu/projects/papi/downloads/
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

CPRT_PAPI_PERCTR_INSTALLED=no

PKGSUBDIR=$(PKGNAME)/src

DEPENDS+=	

DESCRIPTION+=	"PAPI aims to provide the tool designer and application engineer with a"
DESCRIPTION+=   "consistent interface and methodology for use of the performance counter"
DESCRIPTION+=   "hardware found in most major microprocessors"


ifeq  ("X$(CPRT_PAPI_PERCTR_INSTALLED)","Xno")
ifeq  ("X$(CPRT_PAPI_KERNEL)","Xno")
$(error not a papi kernel; if perfctr module installed, set CPRT_PAPI_PERCTR_INSTALLED)
endif
endif

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	make

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC); \
        make test; \
	make fulltest

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	make install-all; 


include ../../../mk/gnu.post.mk
