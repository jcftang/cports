#
# MPICH1 is not supported, users should use openmpi or mpich2
#

include ../../../mk/gnu.pre.mk

DISTNAME=	mpich
VERSION=	1.2.7p1
CATEGORIES=	devel
HOMEPAGE=	http://www-unix.mcs.anl.gov/mpi/mpich/
MASTER_SITES=	ftp://ftp.mcs.anl.gov/pub/mpi/
MAINTAINER=	jtang@tchpc.tcd.ie

#GNU_CONFIGURE=	yes
HAS_CONFIGURE= 	no
ALL_TARGET= mpi

DESCRIPTION=	"MPICH is a freely available, portable implementation of MPI,"
DESCRIPTION+=	"the Standard for message-passing libraries."

do-configure: do-configur%
	cd $(WRKSRC); \
	./configure --prefix=$(PROGRAM_PREFIX) \
	--enable-f77 \
	--enable-f90modules \
	--with-default-comm=mpich-p4 \
	--with-device=ch_p4 --with-comm=shared


include ../../../mk/gnu.post.mk

