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
ACTIVATION_METHOD=license_server

CPRT_MKL_MAN_LANG=en_US

HAS_CONFIGURE=	no

PKGSUBDIR=	$(DISTNAME)_$(VERSION)

DESCRIPTION=	"Intel MKL"

#CPRT_MKL_LIBSUBDIR:=em64t
CPRT_MKL_LIBSUBDIR:=intel64
CPRT_MKL_LIBSUBDIR:=$(strip $(if $(findstring IA_64,$(SYSTEM_TYPE_CPU)),intel64,$(CPRT_MKL_LIBSUBDIR)))
CPRT_MKL_LIBSUBDIR:=$(strip $(if $(findstring 32,$(SYSTEM_TYPE_CPU)),ia32,$(CPRT_MKL_LIBSUBDIR)))

$(intel mkl lib arch/subdir: $(CPRT_MKL_LIBSUBDIR))

MODULEFILE_LINES+=      MKL
MODULEFILE_CMD_MKL?= \
        $(ECHO) "setenv  MKLROOT $(PROGRAM_PREFIX)/mkl"; \
        $(ECHO) "setenv  MKL_DIR $(PROGRAM_PREFIX)/mkl"; \
        $(ECHO) "setenv  MKL_PATH $(PROGRAM_PREFIX)/mkl"; \
	$(ECHO) "setenv  INTEL_LICENSE_FILE  $(LICENSEFILE)";

MODULEFILE_CMD_INCLUDEPATH= \
                $(ECHO) "prepend-path INCLUDE_PATH $(PROGRAM_PREFIX)/mkl/include"; \
                $(ECHO) "prepend-path CPLUS_INCLUDE_PATH $(PROGRAM_PREFIX)/mkl/include"; \
                $(ECHO) "prepend-path C_INCLUDE_PATH $(PROGRAM_PREFIX)/mkl/include";

MODULEFILE_CMD_LIBPATH= \
                $(ECHO) "prepend-path LD_LIBRARY_PATH $(PROGRAM_PREFIX)/mkl/lib/$(CPRT_MKL_LIBSUBDIR)"; \
                $(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/mkl/lib/$(CPRT_MKL_LIBSUBDIR)"; \
                $(ECHO) "prepend-path LIBRARY_PATH $(PROGRAM_PREFIX)/mkl/lib/$(CPRT_MKL_LIBSUBDIR)";

MODULEFILE_CMD_MANPATH+= \
	 $(ECHO) "prepend-path MANPATH $(PROGRAM_PREFIX)/man/$(CPRT_MKL_MAN_LANG)";

do-configure:
	if [ -d $(HOME)/intel ]; then \
	    echo "Error: remove intel dir in home dir"; exit 1; fi; 
	$(SED) -e "s,@license@,$(LICENSEFILE)," $(CURDIR)/files/silent.ini | \
	$(SED) -e "s,@activation@,$(ACTIVATION_METHOD)," | \
	$(SED) -e "s,@install_dir@,$(PROGRAM_PREFIX)," > $(WORKDIR)/silent.ini.tmp; 
	mv $(WORKDIR)/silent.ini.tmp $(WORKDIR)/silent.ini;

do-build:
	@	

do-install:
	if [ ! -d $(WORKDIR)/tmp ]; then \
	     $(MKDIR) $(WORKDIR)/tmp; \
	fi;
	cd ${WORKDIR}/$(PKGSUBDIR); \
	./install.sh -t $(WORKDIR)/tmp --silent $(WORKDIR)/silent.ini 

include ../../../mk/gnu.post.mk
