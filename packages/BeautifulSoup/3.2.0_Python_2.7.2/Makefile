include ../../../mk/gnu.pre.mk

DISTNAME=	BeautifulSoup
VERSION=	3.2.0
CATEGORIES=	bio
HOMEPAGE=	http://www.crummy.com/software/BeautifulSoup/
MASTER_SITES=	http://www.crummy.com/software/BeautifulSoup/download/3.x/
MAINTAINER=	neil@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_Python_2.7.2

DEPENDS+=	"Python/2.7.2 --build-env --run-env"

DESCRIPTION=	"Beautiful Soup is a Python HTML/XML parser designed for quick turnaround projects like screen-scraping."

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

do-test:
	$(MODULE_ADD) $(RUN_DEPENDS) $(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) ; \
	python -c 'import BeautifulSoup;'; \

include ../../../mk/gnu.post.mk
