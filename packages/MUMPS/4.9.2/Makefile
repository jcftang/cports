 ## NOTE hack where  blacs.a is called twice in SCALAP variable below (ffs)

## For the do-configure target there is a lot of sed'ing.  It would be
## worth making sure that it does what you think it does, especially
## for new versions of mumps

include ../../../mk/gnu.pre.mk

DISTNAME=	MUMPS
VERSION=	4.9.2
CATEGORIES=	parallel
MAINTAINER=	darach@tchpc.tcd.ie
HOMEPAGE=	http://graal.ens-lyon.fr/MUMPS/
## This is not freely downloadable; put a copy in your sources dir
MASTER_SITES=	
DISTFILES+=	$(DISTNAME)_$(VERSION).tar.gz

DEPENDS+=	"openmpi/1.4.2 --build-env openmpi/1.4.2 --lib --run-env"
DEPENDS+=	"atlas/3.8.3 --build-env atlas/3.8.3 --lib"
DEPENDS+=	"scalapack/1.8.0_openmpi_1.4.2 --build-env --lib"
DEPENDS+=	"scotch/5.1.9_esmumps --build-env"
DEPENDS+=	"zlib/1.2.5 --build-env --lib"

HAS_CONFIGURE=	no

DO_RUN_TESTS=yes

#CONFIGURE_ARGS+=

DESCRIPTION=	"MUMPS : a parallel sparse direct solver"

# do-fetch:
# 	$(MKDIR) $(DISTDIR)/$(DISTNAME)/$(VERSION); \
# 	cp $(MASTER_SITES)/$(DISTNAME)_$(VERSION).tar.gz  $(DISTDIR)/$(DISTNAME); 

do-fetch:
	@

#CPRT_SCOTCH_MAKEINC ?= Makefile.inc.i686_pc_linux2.shlib
#ifeq ("$(findstring gnu,$(SYSTEM_TYPE_OS))","gnu")
#CPRT_SCOTCH_MAKEINC = Makefile.inc.i686_pc_linux2.shlib
#else
#CPRT_SCOTCH_MAKEINC = Makefile.inc.i686_mac_darwin8
#endif
#

## Note -DAdd_ for gfortran -- will vary with compiler ORDERINGSF =
## -Dscotch -Dmetis -Dpord -Dptscotch -Dparmetis is the most general
## form -- no link to metis yet

## Also, the sed'ing here is more than a bit hairy -- check this out
## when compiling a new version
do-configure:
	echo "configuring (workdir: $(WRKSRC))";
	cd $(SOURCEDIR)/$(DISTNAME)_$(VERSION)/Make.inc; \
	pwd; \
	cat Makefile.inc.generic | \
	$(SED) -e 's|^CC.*=.*|CC = mpicc|'  | \
	$(SED) -e 's|^FC.*=.*|FC = mpif90|' | \
	$(SED) -e 's|^FL.*=.*|FL = mpif90|' | \
	$(SED) -e 's|^SCALAP.*=.*|SCALAP = -L$(PREFIX_scalapack)/lib -lscalapack $(PREFIX_scalapack)/lib/blacs.a $(PREFIX_scalapack)/lib/blacsC.a $(PREFIX_scalapack)/lib/blacsF77.a $(PREFIX_scalapack)/lib/blacs.a|' | \
	$(SED) -e 's|^LIBBLAS.*=.*|LIBBLAS = -L$(PREFIX_atlas)/lib -lcblas -lf77blas  -latlas -llapack|' | \
	$(SED) -e 's|^CDEFS.*=.*|CDEFS   = -DAdd_|' | \
	$(SED) -e 's|^INCPAR.*=.*|INCPAR = -I$(PREFIX_scalapack)/include -I$(PREFIX_openmpi)/include|' | \
	$(SED) -e 's|^LIBPAR.*=.*|LIBPAR = $$(SCALAP) -L$(PREFIX_openmpi)/lib -lmpi|' | \
	$(SED) -e 's|^#SCOTCHDIR.*=.*|SCOTCHDIR = $(PREFIX_scotch)|' | \
	$(SED) -e 's|^#ISCOTCH.*=.*|ISCOTCH = -I$$(SCOTCHDIR)/include|' | \
	$(SED) -e 's|^#LSCOTCH.*=.*ptesmumps.*|LSCOTCH = -L$$(SCOTCHDIR)/lib -lptesmumps -lptscotch -lptscotcherr -lz|' | \
	$(SED) -e 's|^ORDERINGSF.*=.*|#ORDERINGSF =   -Dpord  |' | \
	$(SED) -e 's|^#ORDERINGSF.*=.*Dptscotch.*|ORDERINGSF = -Dscotch  -Dpord -Dptscotch |'  \
	> ../Makefile.inc

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(SOURCEDIR)/$(DISTNAME)_$(VERSION); \
	make d z c s dexamples zexamples

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	$(MKDIR) $(PROGRAM_PREFIX)/lib; \
	$(MKDIR) $(PROGRAM_PREFIX)/include; \
	cd $(SOURCEDIR)/$(DISTNAME)_$(VERSION); \
	$(INSTALL) -m 755 ./lib/libmumps_common.a  $(PROGRAM_PREFIX)/lib; \
	$(INSTALL) -m 755 ./lib/lib*.a  $(PROGRAM_PREFIX)/lib; \
	$(INSTALL) -m 755 ./include/*.h $(PROGRAM_PREFIX)/include; \
	cp -r examples  $(PROGRAM_PREFIX); chmod -R 755 $(PROGRAM_PREFIX)/examples

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);			\
	$(ECHO_MSG) "Testing for package $(DISTNAME)_$(VERSION) (double precision real and complex only)";			\
	cd $(SOURCEDIR)/$(DISTNAME)_$(VERSION)/examples; \
	echo "----- test description -----" >> $(CURDIR)/testlog; \
	cat README >> $(CURDIR)/testlog; \
	echo "----- RESULTS -----" >> $(CURDIR)/testlog; \
	echo "----- Double  precision simple test -----" >> $(CURDIR)/testlog; \
	mpirun -np 2 ./dsimpletest < input_simpletest_real 2>&1 | tee  -a $(CURDIR)/testlog; \
	echo "----- Complex double simple test -----" >> $(CURDIR)/testlog; \
	mpirun -np 2 ./zsimpletest < input_simpletest_cmplx 2>&1 | tee  -a $(CURDIR)/testlog; \
	echo "----- C example -----" >> $(CURDIR)/testlog; \
	mpirun -np 3 ./c_example 2>&1 | tee  -a $(CURDIR)/testlog; \
	echo "---------------- done ----------------" >> $(CURDIR)/testlog;

include ../../../mk/gnu.post.mk

