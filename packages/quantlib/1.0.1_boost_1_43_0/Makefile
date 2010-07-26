include ../../../mk/gnu.pre.mk

DISTNAME=	QuantLib
VERSION=	1.0.1
CATEGORIES=	library
HOMEPAGE=	http://www.boost.org/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/quantlib/QuantLib/1.0.1
GNU_CONFIGURE = yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=_boost_1_43_0

DEPENDS+="boost/1_43_0_openmpi_1.4.2 --build-env  boost/1_43_0_openmpi_1.4.2 --lib" 

DESCRIPTION=	"A free/open-source library for quantitative finance"

CONFIGURE_ARGS += --with-boost-include=$(PREFIX_boost)/include
CONFIGURE_ARGS += --with-boost-lib=$(PREFIX_boost)/lib

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	make; \
	make check 2>&1 | tee testlog; 

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
        make install; 

include ../../../mk/gnu.post.mk


