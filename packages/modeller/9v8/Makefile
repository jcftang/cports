include ../../../mk/gnu.pre.mk

DISTNAME=	modeller
VERSION=	9v8
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://www.salilab.org/modeller/
MASTER_SITES=	http://www.salilab.org/modeller/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DESCRIPTION=	"MODELLER is used for homology or comparative modeling of protein"
DESCRIPTION+=	"three-dimensional structures (1,2). The user provides an alignment"
DESCRIPTION+=	"of a sequence to be modeled with known related structures and"
DESCRIPTION+=	"MODELLER automatically calculates a model containing all non-hydrogen"
DESCRIPTION+=	"atoms. MODELLER implements comparative protein structure modeling by"
DESCRIPTION+=	"satisfaction of spatial restraints (3,4), and can perform many additional"
DESCRIPTION+=	"tasks, including de novo modeling of loops in protein structures,"
DESCRIPTION+=	"optimization of various models of protein structure with respect to"
DESCRIPTION+=	"a flexibly defined objective function, multiple alignment of protein"
DESCRIPTION+=	"sequences and/or structures, clustering, searching of sequence databases,"
DESCRIPTION+=	"comparison of protein structures, etc."
#PKGSUBDIR=	$(DISTNAME)_$(VERSION)

ifndef MODELLER_LICENSE
$(error Please specify MODELLER_LICENSE)
endif

do-build:
	#no-op don't need to build this
	@:

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	cd $(WRKSRC); \
	pwd ;\
	( echo 6; echo $(PROGRAM_PREFIX) ; echo $(MODELLER_LICENSE) ; echo yes; echo yes; echo yes ) | ./Install

include ../../../mk/gnu.post.mk
