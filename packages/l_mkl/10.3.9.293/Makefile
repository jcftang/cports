include ../../../mk/gnu.pre.mk

DISTNAME=	l_mkl
VERSION=	10.3.9.293
EXTRAVERSION=	
CATEGORIES=	numerical
HOMEPAGE=	http://software.intel.com/en-us/intel-mkl/
MASTER_SITES=	
HAVE_SOFTWARE=	yes
MAINTAINER=	neil@tchpc.tcd.ie

# Dist files are actually the INTEL CC Composer files. THis contains the mkl RPM's
# This is perhaps not the best way to do things !
COMPOSERDIST=	l_ccompxe_intel64_2011.9.293
DISTFILES=	$(COMPOSERDIST).tgz


CPRT_MKL_MAN_LANG=en_US
HAS_CONFIGURE=	no
PKGSUBDIR=	$(COMPOSERDIST)
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
        $(ECHO) "setenv  MKL_PATH $(PROGRAM_PREFIX)/mkl"; 

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
	@

do-build:
	if [ ! -d $(WORKDIR)/tmp ]; then \
		$(MKDIR) $(WORKDIR)/tmp; \
	fi; 
	if [ ! -d $(WORKDIR)/tmp/privaterpmdb ]; then \
                $(MKDIR) $(WORKDIR)/tmp/privaterpmdb; \
        fi;
	$(CP) $(WORKDIR)/$(PKGSUBDIR)/rpms/intel-mkl*.rpm $(WORKDIR)/tmp; \
	cd $(WORKDIR)/tmp/; \
	/bin/rpm --initdb --dbpath $(WORKDIR)/tmp/privaterpmdb; \

do-install:
	cd $(WORKDIR)/tmp/; \
	for i in $$(ls *.rpm); do echo $$i; /bin/rpm -ivh $$i --prefix $(PROGRAM_PREFIX) --dbpath $(WORKDIR)/tmp/privaterpmdb --nodeps; done



include ../../../mk/gnu.post.mk
