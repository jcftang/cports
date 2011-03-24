include ../../../mk/gnu.pre.mk

DISTNAME=	l_mkl_p
VERSION=	10.2.2.025
EXTRAVERSION=	
CATEGORIES=	numerical
HOMEPAGE=	http://software.intel.com/en-us/intel-mkl/
MASTER_SITES=	
HAVE_SOFTWARE=	yes
MAINTAINER=	jtang@tchpc.tcd.ie
DISTFILES = 	$(DISTNAME)_$(VERSION).tar.gz

HAS_CONFIGURE=	no

PKGSUBDIR=	$(DISTNAME)_$(VERSION)

DESCRIPTION=	"Intel MKL"

do-build:
	${SED} -e "s|PSET_INSTALL_DIR=.*|PSET_INSTALL_DIR=${PROGRAM_PREFIX}|g" ${CURDIR}/files/silent.ini > ${SRCDIR}/silent.ini
	${MKDIR} ${SRCDIR}/tmp
	
do-install:
	cd ${WRKSRC} ;\
	./install.sh -t ${SRCDIR}/tmp -s silent.ini -l default

include ../../../mk/gnu.post.mk
