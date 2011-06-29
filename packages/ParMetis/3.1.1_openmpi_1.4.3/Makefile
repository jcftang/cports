include ../../../mk/gnu.pre.mk

DISTNAME=	ParMetis
VERSION=	3.1.1
CATEGORIES=     paralleltools	
HOMEPAGE=	http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview
MASTER_SITES=	http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis
MAINTAINER=	darach@tchpc.tcd.ie
HAS_CONFIGURE = no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=$(strip _openmpi_1.4.3)

TDEPEND="openmpi/1.4.3 --build-env openmpi/1.4.3 --run-env" 
DEPENDS+=$(TDEPEND)

DESCRIPTION=	"ParMETIS is an MPI-based parallel library that implements a variety of algorithms for partitioning unstructured graphs, meshes, and for computing fill-reducing orderings of sparse matrices."

#CONFIGURE_ARGS +=

do-configure:
	@
do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC);  \
	$(MAKE) OPTFLAGS="-O2 -fPIC " ; \
	cd Graphs; \
	mpirun -np 4 ptest rotor.graph; \
	mpirun -np 4 mtest bricks.hex3d 2

do-install:
	$(MKDIR) $(PROGRAM_PREFIX)/lib;
	$(MKDIR) $(PROGRAM_PREFIX)/include;
	$(INSTALL) -m 644 $(WRKSRC)/*.a  $(PROGRAM_PREFIX)/lib;
	$(INSTALL) -m 644 $(WRKSRC)/parmetis.h  $(PROGRAM_PREFIX)/include
	$(INSTALL) -m 644 $(WRKSRC)/METISLib/metis.h  $(PROGRAM_PREFIX)/include
	

include ../../../mk/gnu.post.mk


