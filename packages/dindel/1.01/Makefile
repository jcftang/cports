include ../../../mk/gnu.pre.mk

DISTNAME=	dindel
VERSION=	1.01
HOMEPAGE=	http://www.sanger.ac.uk/resources/software/dindel/
MASTER_SITES=	ftp://ftp.sanger.ac.uk/pub4/resources/software/dindel/source_code/
MAINTAINER=	neil@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=  no
DISTFILES = 	$(DISTNAME)-$(VERSION)-src.tar.gz

PKGSUBDIR=      $(DISTNAME)-$(VERSION)-src


DESCRIPTION=	"Dindel is a program for calling small indels from short-read sequence data"

DEPENDS+=	"boost/1_41_0_openmpi_1.4.2 --build-env --lib"
DEPENDS+=	"samtools/0.1.8	--build-env --lib"
DEPENDS+=	"zlib/1.2.5	--build-env --lib"


do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
        cd $(WRKSRC); \
	$(MAKE)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	mkdir -p $(PROGRAM_PREFIX); \
	cp -r $(WRKSRC)/* $(PROGRAM_PREFIX); \
	cd $(PROGRAM_PREFIX); \
	mkdir bin; \
	cp dindel ./bin
	

include ../../../mk/gnu.post.mk
