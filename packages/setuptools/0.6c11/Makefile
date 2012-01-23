include ../../../mk/gnu.pre.mk

DISTNAME=	setuptools
VERSION=	0.6c11
CATEGORIES=     system
HOMEPAGE=       http://pypi.python.org/pypi/setuptools
MASTER_SITES=	http://pypi.python.org/packages/source/s/setuptools/
MAINTAINER=     jtang@tchpc.tcd.ie
HAS_CONFIGURE=  no

DEPENDS+= 	"Python/2.6.5 --lib --build-env --run-env"
DESCRIPTION=    "Download, build, install, upgrade, and uninstall Python packages"

MODULEFILE_LINES+=	PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
	$(ECHO)	"prepend-path	PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages/";
PYTHONPATH=$(PROGRAM_PREFIX)/lib/python2.6/site-packages/
	
do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	python setup.py build;

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) -p $(PROGRAM_PREFIX)/lib/python2.6/site-packages/; \
	python setup.py install --prefix=$(PROGRAM_PREFIX);
	#python setup.py install --install-dir=$(PROGRAM_PREFIX);

include ../../../mk/gnu.post.mk

