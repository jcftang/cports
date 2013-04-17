include ../../../mk/gnu.pre.mk

DISTNAME=	rjungle-mpi
VERSION=	2.0.0
CATEGORIES=	numeric
HOMEPAGE=       http://imbs-luebeck.de/imbs/de/node/227	
MASTER_SITES=   http://imbs-luebeck.de/imbs/sites/default/files/u38
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	no

EXTRAVERSION=centos

PKGSUBDIR=rjungle-bin-pkg-$(VERSION)-$(SYSTEM_TYPE_CPU)-pc-$(EXTRAVERSION)-gnu-mpi
DISTFILES = $(PKGSUBDIR).tar_.gz

DEPENDS+=	"gsl/1.9 --run-env"
DEPENDS+=	"openmpi/1.4.2 --run-env"

DESCRIPTION=	"The novel software package RJ implements all features of the reference implementation randomForest such as various tuning parameters, prediction of new datasets using previously grown forests, sample proximities and imputation. Commonly used measures are implemented, such as Gini importance, permutation importance and conditional importance measures. RJ additionally implements the variable backward elimination. When multiple CPU are available, RJ is able to perform RF on multiple CPUs simultaneously using multithreading and Message Passing Interface (MPI) parallelization"

do-extract:
	$(QUIET) $(MKDIR) $(SOURCEDIR)
	$(QUIET) $(ECHO_MSG) "Extracting file(s) for $(DISTNAME)-$(VERSION)";	\
	umask 022;								\
	cp $(_DISTDIR)/$(PKGSUBDIR).tar_.gz $(SOURCEDIR);                       \
	cd $(SOURCEDIR);                                                        \
	tar zxvf $(PKGSUBDIR).tar_.gz

do-configure:
	@

do-build:
	@

do-install:
	if [ ! -d  $(PROGRAM_PREFIX) ]; then \
		$(MKDIR) $(PROGRAM_PREFIX);  \
	fi;
	cd $(WORKDIR); \
	rsync -avz $(PKGSUBDIR)/ $(PROGRAM_PREFIX)/

include ../../../mk/gnu.post.mk
