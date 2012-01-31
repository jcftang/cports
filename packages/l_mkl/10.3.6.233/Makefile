include ../../../mk/gnu.pre.mk

DISTNAME=	l_mkl
VERSION=	10.3.6.233
EXTRAVERSION=	
CATEGORIES=	numerical
HOMEPAGE=	http://software.intel.com/en-us/intel-mkl/
MASTER_SITES=	
HAVE_SOFTWARE=	yes
MAINTAINER=	jtang@tchpc.tcd.ie
#PKGNAME=   l_mkl_$(VERSION)
#PKGSUBDIR=   l_mkl_$(VERSION)
DISTFILES = 	$(DISTNAME)_$(VERSION).tgz

#LICENSEFILE=/home/support/licenses/intel/
LICENSEFILE=28518@lic.tchpc.tcd.ie

CPRT_MKL_MAN_LANG=en_US

HAS_CONFIGURE=	no

PKGSUBDIR=	$(DISTNAME)_$(VERSION)

DESCRIPTION=	"Intel MKL"

CPRT_MKL_LIBSUBDIR:=em64t
CPRT_MKL_LIBSUBDIR:=$(strip $(if $(findstring IA_64,$(SYSTEM_TYPE_CPU)),64,$(CPRT_MKL_LIBSUBDIR)))
CPRT_MKL_LIBSUBDIR:=$(strip $(if $(findstring 32,$(SYSTEM_TYPE_CPU)),32,$(CPRT_MKL_LIBSUBDIR)))

$(warning mkl lib subdir: $(CPRT_MKL_LIBSUBDIR))

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

MODULEFILE_CMD_LIBPATH= \
                $(ECHO) "prepend-path LD_LIBRARY_PATH $(PROGRAM_PREFIX)/lib/$(CPRT_MKL_LIBSUBDIR)"; \
                $(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/lib/$(CPRT_MKL_LIBSUBDIR)"; \
                $(ECHO) "prepend-path LIBRARY_PATH $(PROGRAM_PREFIX)/lib/$(CPRT_MKL_LIBSUBDIR)";

MODULEFILE_CMD_MANPATH+= \
	 $(ECHO) "prepend-path MANPATH $(PROGRAM_PREFIX)/man/$(CPRT_MKL_MAN_LANG)";

do-build:
	${SED} -e "s|PSET_INSTALL_DIR=.*|PSET_INSTALL_DIR=${PROGRAM_PREFIX}|g" ${CURDIR}/files/silent.ini > ${SRCDIR}/silent.ini
	${MKDIR} ${SRCDIR}/tmp
	
do-install:
	cd ${WORKDIR}/$(PKGSUBDIR) ;\
	./install.sh -t ${SRCDIR}/tmp -s silent.ini -l default

include ../../../mk/gnu.post.mk
