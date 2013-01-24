include ../../../mk/gnu.pre.mk

DISTNAME=	hpctoolkit
VERSION=	5.3.2
RELEASEN=       3950
VIEWERELEASEN=  1514
HOMEPAGE=	http://hpctoolkit.org/
MASTER_SITES=	https://outreach.scidac.gov/frs/download.php
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	

DISTFILES = $(DISTNAME)-externals-$(VERSION)-r$(RELEASEN).tar.gz \
            $(DISTNAME)-$(VERSION)-r$(RELEASEN).tar.gz \
            hpcviewer-$(VERSION)-release-linux.gtk.x86_64.tgz \
            hpctraceviewer-$(VERSION)-release-linux.gtk.x86_64.tgz
#
PKGSUBDIR=$(PKGNAME)/src

DEPENDS+=  "papi/5.0.1  --lib --build-env"
DEPENDS+=  "openmpi/1.5.3 --lib --build-env --run-env"
DEPENDS+=  "gtk+/2.20.1 --lib --build-env"

DESCRIPTION+=	"HPCToolkit is an integrated suite of tools for measurement and analysis of program performance on computers ranging from multicore desktop systems to the largest supercomputers."

do-fetch:
	if [ ! -e $(DISTDIR)/$(DISTNAME) ]; then $(MKDIR)  $(DISTDIR)/$(DISTNAME);fi;
	for ff in $(DISTFILES); do \
	   if [ ! -e $(DISTDIR)/$(DISTNAME)/$$ff ]; then \
	$(WGET) -O $(DISTDIR)/$(DISTNAME)/$(DISTNAME)-externals-$(VERSION)-r$(RELEASEN).tar.gz  https://outreach.scidac.gov/frs/download.php/848/$(DISTNAME)-externals-$(VERSION)-r$(RELEASEN).tar.gz; \
	$(WGET) -O $(DISTDIR)/$(DISTNAME)/$(DISTNAME)-$(VERSION)-r$(RELEASEN).tar.gz  https://outreach.scidac.gov/frs/download.php/847/$(DISTNAME)-$(VERSINO)-r$(RELEASEN).tar.gz; \
	$(WGET) -O $(DISTDIR)/$(DISTNAME)/hpcviewer-$(VERSION)-release-linux.gtk.$(SYSTEM_TYPE_CPU).tgz  https://outreach.scidac.gov/frs/download.php/836/hpcviewer-$(VERSION)-r$(VIEWERELEASEN)-linux.gtk.$(SYSTEM_TYPE_CPU).tgz; \
	$(WGET) -O $(DISTDIR)/$(DISTNAME)/hpctraceviewer-$(VERSION)-release-linux.gtk.$(SYSTEM_TYPE_CPU).tgz  https://outreach.scidac.gov/frs/download.php/844/hpctraceviewer-$(VERSION)-r$(VIEWERELEASEN)-linux.gtk.$(SYSTEM_TYPE_CPU).tgz; \
	   break; \
	   fi; \
	done;

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR)/$(DISTNAME)-externals-$(VERSION)-r$(RELEASEN); \
	mkdir BUILD && cd BUILD; \
	../configure --prefix=$(WORKDIR)/hpctoolkitexternalsinstall; \
	make install;
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR)/$(DISTNAME)-$(VERSION)-r$(RELEASEN); \
        mkdir BUILD && cd BUILD; \
	../configure --prefix=$(PROGRAM_PREFIX) --with-externals=$(WORKDIR)/hpctoolkitexternalsinstall --with-papi=$(PREFIX_papi)

do-build:
	echo build

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR)/$(DISTNAME)-$(VERSION)-r$(RELEASEN)/BUILD; \
	make install; \
	cd $(WORKDIR)/hpcviewer; \
	./install $(PROGRAM_PREFIX); \
	cd $(WORKDIR)/hpctraceviewer; \
        ./install $(PROGRAM_PREFIX); \
	

include ../../../mk/gnu.post.mk
