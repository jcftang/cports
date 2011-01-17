include ../../../mk/gnu.pre.mk

DISTNAME=	breakdancer
VERSION=	1.1_2010_10_25
CATEGORIES=	bio
HOMEPAGE=	http://sourceforge.net/projects/breakdancer
MASTER_SITES=	http://sourceforge.net/projects/breakdancer/files
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	$(DISTNAME)-$(VERSION).zip
EXTRAVERSION=

DESCRIPTION=	"BreakDancer is a Perl package that provides genome-wide detection of structural variants from next generation paired-end sequencing reads."
DEPENDS+=	"samtools/0.1.8 --lib --build-env --run-env"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC)	;\
	cd cpp ;\
	g++ -L$(PREFIX_zlib)/lib  -L$(PREFIX_samtools)/lib -I$(PREFIX_samtools)/include -I. -L. -lm -lz -lbam BreakDancerMax.cpp AlnParser.cpp Poisson.cpp -o breakdancer_max

MODULEFILE_LINES+=      PERL5LIB
MODULEFILE_CMD_PERL5LIB?= \
        $(ECHO) "prepend-path   PERL5LIB $(PROGRAM_PREFIX)/lib";

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC) ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/lib ;\
	$(INSTALL) cpp/breakdancer_max $(PROGRAM_PREFIX)/bin ;\
	for i in bam2cfg.pl ; do $(INSTALL) perl/$$i $(PROGRAM_PREFIX)/bin/$$i; done; \
	for i in AlnParser.pm Poisson.pm; do $(INSTALL) perl/$$i $(PROGRAM_PREFIX)/lib/$$i; done;

include ../../../mk/gnu.post.mk
