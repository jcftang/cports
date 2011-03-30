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

LICENSEFILE=/home/support/licenses/intel/

CPRT_MKL_MAN_LANG=en_US

HAS_CONFIGURE=	no

PKGSUBDIR=	$(DISTNAME)_$(VERSION)

DESCRIPTION=	"Intel MKL"

MODULEFILE_LINES+=      MKL
MODULEFILE_CMD_MKL?= \
        $(ECHO) "setenv  MKLROOT $(PROGRAM_PREFIX)"; \
        $(ECHO) "setenv  MKL_DIR $(PROGRAM_PREFIX)"; \
        $(ECHO) "setenv  MKL_PATH $(PROGRAM_PREFIX)"; \
	$(ECHO) "setenv  INTEL_LICENSE_FILE  $(LICENSEFILE)";

MODULEFILE_CMD_INCLUDEPATH= \
                $(ECHO) "prepend-path INCLUDE_PATH $(PROGRAM_PREFIX)/include"; \
                $(ECHO) "prepend-path CPLUS_INCLUDE_PATH $(PROGRAM_PREFIX)/include"; \
                $(ECHO) "prepend-path C_INCLUDE_PATH $(PROGRAM_PREFIX)/include";

MODULEFILE_CMD_MANPATH+= \
	 $(ECHO) "prepend-path MANPATH $(PROGRAM_PREFIX)/man/$(CPRT_MKL_MAN_LANG)";

do-build:
	${SED} -e "s|PSET_INSTALL_DIR=.*|PSET_INSTALL_DIR=${PROGRAM_PREFIX}|g" ${CURDIR}/files/silent.ini > ${SRCDIR}/silent.ini
	${MKDIR} ${SRCDIR}/tmp
	
do-install:
	cd ${WRKSRC} ;\
	./install.sh -t ${SRCDIR}/tmp -s silent.ini -l default

include ../../../mk/gnu.post.mk
