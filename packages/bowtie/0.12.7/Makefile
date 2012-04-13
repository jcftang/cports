include ../../../mk/gnu.pre.mk

DISTNAME=	bowtie
VERSION=	0.12.7
CATEGORIES=	bio
HOMEPAGE=	http://sourceforge.net/projects/bowtie
MASTER_SITES=	http://sourceforge.net/projects/bowtie-bio/files/$(DISTNAME)/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	$(DISTNAME)-$(VERSION)-src.zip
EXTRAVERSION=

DESCRIPTION=	"Bowtie, an ultrafast, memory-efficient short read aligner for short DNA sequences (reads) from next-gen sequencers. Please cite: Langmead B, et al. Ultrafast and memory-efficient alignment of short DNA sequences to the human genome. Genome Biol 10:R25."

DEPENDS+=	"samtools/0.1.18 --lib --build-env --run-env"
DEPENDS+=	"zlib/1.2.6 --lib --build-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC)	;\
	$(MAKE)

MODULEFILE_LINES+=      PERL5LIB
MODULEFILE_CMD_PERL5LIB?= \
        $(ECHO) "prepend-path   PERL5LIB $(PROGRAM_PREFIX)/lib";

BIN=bowtie bowtie-build bowtie-inspect
do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC) ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/lib ;\
	for i in $(BIN) ; do $(INSTALL) $$i $(PROGRAM_PREFIX)/bin/$$i; done; \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - )

include ../../../mk/gnu.post.mk
