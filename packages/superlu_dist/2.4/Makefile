 ## NOTE hack where  blacs.a is called twice in SCALAP variable below (ffs)

## For the do-configure target there is a lot of sed'ing.  It would be
## worth making sure that it does what you think it does, especially
## for new versions of mumps

include ../../../mk/gnu.pre.mk

DISTNAME=	superlu_dist
VERSION=	2.4
PKGFILENAME=    superlu_dist_$(VERSION)
PKGSUBDIR=      SuperLU_DIST_$(VERSION)
CATEGORIES=	parallel
MAINTAINER=	darach@tchpc.tcd.ie
HOMEPAGE=	http://crd.lbl.gov/~xiaoye/SuperLU/index.html#superlu_dist
MASTER_SITES=	http://crd.lbl.gov/~xiaoye/SuperLU/

DEPENDS+=	"openmpi/1.4.2 --build-env openmpi/1.4.2 --lib --run-env"
DEPENDS+=	"atlas/3.8.3 --build-env atlas/3.8.3 --lib"
DEPENDS+=	"ParMetis/3.1.1 --build-env openmpi/1.4.2 --lib"
#DEPENDS+=	"scalapack/1.8.0_openmpi_1.4.2 --build-env --lib"
#DEPENDS+=	"scotch/5.1.9_esmumps --build-env"
#DEPENDS+=	"zlib/1.2.5 --build-env --lib"

HAS_CONFIGURE=	no

DO_RUN_TESTS=yes

#CONFIGURE_ARGS+=

DESCRIPTION=	"SuperLU_DIST : a parallel sparse direct solver"

## Also, the sed'ing here is more than a bit hairy -- check this out
## when compiling a new version
do-configure:
	echo "configuring (workdir: $(WRKSRC))";
	cd $(WRKSRC); \
	mv make.inc make.inc.tmp; \
	cat make.inc.tmp | \
	$(SED) -e 's|^PLAT.*=.*|PLAT = cports|'  | \
	$(SED) -e 's|^DSuperLUroot.*=.*|DSuperLUroot = $(WRKSRC)|'  | \
	$(SED) -e 's|^BLASLIB.*=.*|BLASLIB = -L$(PREFIX_atlas)/lib -lcblas -lf77blas  -latlas |' |  \
	$(SED) -e 's|^METISLIB.*=.*|METISLIB = -L$(PREFIX_ParMetis)/lib -lmetis |' |  \
	$(SED) -e 's|^PARMETISLIB.*=.*|PARMETISLIB = -L$(PREFIX_ParMetis)/lib -lparmetis |' |  \
	$(SED) -e 's|^FLIBS.*=.*|FLIBS = -lgfortran -lgfortranbegin |'  | \
	$(SED) -e 's|^CC.*=.*|CC = mpicc |' |  \
	$(SED) -e 's|^CFLAGS.*=.*|CFLAGS = -fPIC -DDEBUGlevel=0 -DPRNTlevel=1 #-D_LONGINT |' |  \
	$(SED) -e 's|^NOOPTS.*=.*|NOOPTS = -O0 -fPIC |' |  \
	$(SED) -e 's|^FORTRAN.*=.*|FORTRAN = mpif90 |' |  \
	$(SED) -e 's|^FFLAGS.*=.*|FFLAGS = -fPIC |' |  \
	$(SED) -e 's|^LOADER.*=.*|LOADER = $$(CC)  |' |  \
	$(SED) -e 's|^CDEFS.*=.*|CDEFS =  -DAdd_ |' \
	> make.inc; \
	rm make.inc.tmp

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	make 

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	$(MKDIR) $(PROGRAM_PREFIX)/lib; \
	$(MKDIR) $(PROGRAM_PREFIX)/include; \
	cd $(WRKSRC); \
	$(INSTALL) -m 755 ./lib/*.a  $(PROGRAM_PREFIX)/lib; \
	$(INSTALL) -m 755 ./SRC/*.h  $(PROGRAM_PREFIX)/include; \
	cp -r EXAMPLE  $(PROGRAM_PREFIX); chmod -R 755 $(PROGRAM_PREFIX)/EXAMPLE

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);			\
	$(ECHO_MSG) "Testing for package $(DISTNAME)_$(VERSION) (double precision real and complex only)";			\
	cd $(WRKSRC)/EXAMPLE; \
	echo "----- test description -----" >> $(CURDIR)/testlog; \
	cat README >> $(CURDIR)/testlog; \
	echo "----- RESULTS -----" >> $(CURDIR)/testlog; \
	echo "----- real test 1 -----" >> $(CURDIR)/testlog; \
	echo mpirun -np 4 ./pddrive -r 2 -c 2 g20.rua >> $(CURDIR)/testlog; \
	mpirun -np 4 ./pddrive -r 2 -c 2 g20.rua 2>&1 | tee  -a $(CURDIR)/testlog; \
	echo "----- real test 2 -----" >> $(CURDIR)/testlog; \
	echo mpirun -np 10 ./pddrive4  g20.rua >> $(CURDIR)/testlog; \
	mpirun -np 10 ./pddrive4  g20.rua 2>&1 | tee  -a $(CURDIR)/testlog; \
	echo "----- Complex  test 1 -----" >> $(CURDIR)/testlog; \
	echo mpirun -np 4 ./pzdrive -r 2 -c 2 cg20.cua >> $(CURDIR)/testlog; \
	mpirun -np 4 ./pzdrive -r 2 -c 2 cg20.cua 2>&1 | tee  -a $(CURDIR)/testlog; \
	echo "---------------- done ----------------" >> $(CURDIR)/testlog;

include ../../../mk/gnu.post.mk

