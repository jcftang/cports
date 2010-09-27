include ../../../../../mk/gnu.pre.mk

DISTNAME=       rJava
VERSION=        0.8-6

DEPENDS+="jdk/1.6.0_21 --build-env jdk/1.6.0_21 --run-env"
#R_DEPENDS+="Rmpi"

#CPRT_R_INSTARGS += --configure-args=--with-mpi=$(PREFIX_openmpi)
CPRT_R_INSTARGS += 

include ../../../../../mk/prg.Rmod.mk

do-configure:
ifdef R_DEPENDS
        $(QUIET) \
        for R_DEP in $(R_DEPENDS) ; do \
                grep -E >/dev/null "^$$R_DEP/" $(R_PREFIX)/.installed_modules || \
                (echo "*** ERROR: Prerequisite module $$R_DEP not installed." && \
                exit 1); \
        done
endif
# left over from perl version
#       $(QUIET) \
#       cd $(WRKSRC) ; $(CONFIGURE_ENV) $(R_BINARY) Makefile.PL $(R_MAKEOPTS)

# Tell the world that we installed the module. We do not wish to do
# the do-instal% stuff since that also creates directories that we do
# not wish to have. Thus the first two lines are ripped directly from
# gnu.mpkg.mk

do-build:
# Need to run this javareconf arg to facilitate this install.
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC) && $(SETENV) $(R_BINARY) CMD javareconf 

do-install:
	$(QUIET) \
        $(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC) && $(SETENV) $(R_BINARY) CMD INSTALL $(CPRT_R_INSTARGS) $(WRKSRC)  && \
        echo "$(DISTNAME)/$(VERSION)/" >> $(R_PREFIX)/.installed_modules




include ../../../../../mk/gnu.post.mk


