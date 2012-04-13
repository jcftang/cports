include ../../../mk/gnu.pre.mk

DISTNAME=	bowtie2
VERSION=	2.0.0-beta5
CATEGORIES=	bio
HOMEPAGE=	http://sourceforge.net/projects/bowtie
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/bowtie-bio/$(DISTNAME)/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	$(DISTNAME)-$(VERSION)-linux-x86_64.zip
# There only appears to the a binary distribution available at the moment
#DISTFILES = 	$(DISTNAME)-$(VERSION)-src.zip
EXTRAVERSION=

DESCRIPTION=	"Bowtie, an ultrafast, memory-efficient short read aligner for short DNA sequences (reads) from next-gen sequencers. Please cite: Langmead B, et al. Ultrafast and memory-efficient alignment of short DNA sequences to the human genome. Genome Biol 10:R25."

DEPENDS+=	"samtools/0.1.18 --lib --build-env --run-env"
DEPENDS+=	"zlib/1.2.6 --lib --build-env"

#do-build:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC)	;\
#	$(MAKE)
do-build:
	@ 


#MODULEFILE_LINES+=      PERL5LIB
#MODULEFILE_CMD_PERL5LIB?= \
#        $(ECHO) "prepend-path   PERL5LIB $(PROGRAM_PREFIX)/lib";

BIN=bowtie2 bowtie2-align bowtie2-align-debug bowtie2-build bowtie2-build-debug bowtie2-inspect bowtie2-inspect-debug 
SCRIPT=convert_quals.pl gen_2b_occ_lookup.pl gen_occ_lookup.pl gen_solqual_lookup.pl infer_fraglen.pl make_a_thaliana_tair.sh make_b_taurus_UMD3.sh make_canFam2.sh make_c_elegans_ws200.sh make_d_melanogaster_fb5_22.sh make_e_coli.sh make_hg18.sh make_hg19.sh make_h_sapiens_ncbi36.sh make_h_sapiens_ncbi37.sh make_mm9.sh make_m_musculus_ncbi37.sh make_rn4.sh make_s_cerevisiae.sh
do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC) ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/doc ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/example ;\
	
	cd $(WRKSRC) ;\
	for i in $(BIN) ; do $(INSTALL) $$i $(PROGRAM_PREFIX)/bin/$$i; done; \
	cd $(WRKSRC) ;\
	for i in $(SCRIPT) ; do $(INSTALL) ./scripts/$$i $(PROGRAM_PREFIX)/bin/$$i; done; \
	cp -r $(WRKSRC)/doc/* $(PROGRAM_PREFIX)/doc ; \
	cp -r $(WRKSRC)/example/* $(PROGRAM_PREFIX)/example;

include ../../../mk/gnu.post.mk
