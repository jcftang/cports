## tarballs are free but require registration/login when downloaded
## the tarballs must be placed in the acml subdir of the cports
## sources tree

include ../../../mk/gnu.pre.mk

DISTNAME=       acml-nosmp
PKGFILENAME= acml
PKGSUBDIR= acml
EXTRAVERSION=   
VERSION=        4-4-0
CATEGORIES=     numerical
HOMEPAGE=       http://developer.amd.com/cpu/Libraries/acml/Pages/default.aspx
MASTER_SITES=   
MAINTAINER=     darach@tchpc.tcd.ie
GNU_CONFIGURE=  no
HAS_CONFIGURE=  no

DESCRIPTION=    "ACML provides a free set of thoroughly optimized and threaded math routines for HPC, scientific, engineering and related compute-intensive applications. ACML is ideal for weather modeling, computational fluid dynamics, financial analysis, oil and gas applications and more."

CPRT_ACML_NBITS=$(strip 64)

#CPRT_ACML_INT_NBITS= -int64
CPRT_ACML_INT_NBITS= 

CPRT_ACML_COMPILER_CLASS := nocompiler
CPRT_ACML_COMPILER_CLASS:=$(strip $(if $(findstring intel, $(COMPILERS)),ifort,$(CPRT_ACML_COMPILER_CLASS)))
CPRT_ACML_COMPILER_CLASS:=$(strip $(if $(findstring gnu, $(COMPILERS)),gfortran,$(CPRT_ACML_COMPILER_CLASS)))
CPRT_ACML_COMPILER_CLASS:=$(strip $(if $(findstring open, $(COMPILERS)),open64,$(CPRT_ACML_COMPILER_CLASS)))

$(info acml class: $(CPRT_ACML_COMPILER_CLASS) )

DISTFILES = $(PKGFILENAME)-$(VERSION)-$(CPRT_ACML_COMPILER_CLASS)-$(CPRT_ACML_NBITS)bit$(strip $(CPRT_ACML_INT_NBITS)).tgz

$(info acml tarfile: $(DISTFILES))

CPRT_ACML_INST_DIR=$(strip $(if $(findstring open, $(CPRT_ACML_COMPILER_CLASS)),$(CPRT_ACML_COMPILER_CLASS)_,$(CPRT_ACML_COMPILER_CLASS)))$(CPRT_ACML_NBITS)

EXTRAVERSION= 
WORKDIRSUFFIX= 

$(info root install dir: $(CPRT_ACML_INST_DIR) )
$(info extraversion: $(EXTRAVERSION) )

MODULEFILE_CMD_INCLUDEPATH= \
		$(ECHO) "prepend-path INCLUDE_PATH $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/include"; \
		$(ECHO) "prepend-path CPLUS_INCLUDE_PATH $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/include"; \
		$(ECHO) "prepend-path C_INCLUDE_PATH $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/include";

MODULEFILE_CMD_LIBPATH= \
		$(ECHO) "prepend-path LD_LIBRARY_PATH $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/lib"; \
		$(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/lib"; \
		$(ECHO) "prepend-path LIBRARY_PATH $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/lib"; \
		$(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/lib";

$(info modules $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/lib)


do-configure:
	@

do-build:
	@

do-install:
	cd $(WORKDIR); \
	./install-$(PKGFILENAME)-$(VERSION)-$(CPRT_ACML_COMPILER_CLASS)-$(CPRT_ACML_NBITS)bit$(strip $(CPRT_ACML_INT_NBITS)).sh -accept -installdir=$(PROGRAM_PREFIX); \
	ln -s $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/lib $(PROGRAM_PREFIX)/lib
	ln -s $(PROGRAM_PREFIX)/$(CPRT_ACML_INST_DIR)/include $(PROGRAM_PREFIX)/include

include ../../../mk/gnu.post.mk
