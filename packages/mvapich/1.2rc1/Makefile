include ../../../mk/gnu.pre.mk

DISTNAME=	mvapich
VERSION=	1.2rc1
CATEGORIES=	development
HOMEPAGE=	http://mvapich.cse.ohio-state.edu/overview/mvapich/
MASTER_SITES=	http://mvapich.cse.ohio-state.edu/download/mvapich/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=


DESCRIPTION=	"MVAPICH (MPI-1 over OpenFabrics/Gen2, OprnFabrics/Gen2-UD, uDAPL, InfiniPath, VAPI and TCP/IP)"


#PKGNAME?=mpiblast-1.6.0
#PKGSUBDIR?=mpiblast-1.6.0
#WRKSRC?=$(WORKDIR)/mpiblast-1.6.0

do-configure:
	@

do-build:
	cd $(WRKSRC); \
	IBHOME=/usr \
	IBHOME_LIB=/usr/lib64 \
	PREFIX=$(PROGRAM_PREFIX) \
	F90='' \
	./make.mvapich.gen2

#do-install:
#	cd $(WRKSRC); make install

include ../../../mk/gnu.post.mk
