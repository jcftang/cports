#
# Copyright (c) 2000 Kungliga Tekniska Högskolan
# (Royal Institute of Technology, Stockholm, Sweden).
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 
# 2. Neither the name of the Institute nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE INSTITUTE AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
#
# $Id: gnu.def.mk,v 1.63 2001/11/28 11:36:49 eskil Exp $
#

-include /etc/mpkg.mk
-include ${HOME}/.mpkg.mk

#
# Working with different systems in one tree.
#
#  If you want to build in a distributed file system on
#  one host and install on another, then you can for example
#  do
#   host1> make build
#   host2> SYSTEM_ID=host1.domain make install
#  Otherwise, if all you Linux Pentium III machines are exactly
#  the same, you can always have SYSTEM_ID=$(SYSTEM_TYPE), but that
#  might break in some cases.
#

SYSTEM_ID?=		${HOSTNAME}

#
# Various paths
#

DISTDIR?=               $(CURDIR)/sources
PREFIX?=		/usr/cports/$(DISTRO_TYPE)
LOCAL_DIST_SITE?=
MODULEDIR?=		/usr/cports/modulefiles/$(DISTRO_TYPE)
MENUDEFSDIR?=		$(PREFIX)/menudefs
BASE_ICONPATH?=		/misc/graphics/icons
INFODIR?=		$(PREFIX)/information

#
# Program
#

COMPILERS?=             gnu
WGET?=			wget
FETCH?=			$(WGET)
BASENAME?=		basename
ECHO_MSG?=		echo -e
ECHO?=			echo
ENV=			env
MKDIR?=			mkdir -p
RMDIR?=			rmdir -p
CAT?=			cat
TOUCH?=			touch

GUNZIP?=		gunzip
GZCAT?=			$(GUNZIP) -c
BZIP2?=			bzip2
BUNZIP2?=		$(BZIP2) -d
BZ2CAT?=		$(BUNZIP2) -c
UNCOMPRESS?=		uncompress
COMPRESSCAT?=		$(UNCOMPRESS) -c

GTAR?=			gtar
TAR?=			tar
TAR_EXTRACT?=		$(TAR) -xf -
CPIO?=			cpio
CPIO_EXTRACT?=		$(CPIO) -i --make-directories

TEST?=			test

ZIP?=			zip
UNZIP?=			unzip

RM?=			rm
RM_RF?=			rm -rf
RM_RI?=			rm -ri
PATCH?=			patch
# XXX Should be installbsd on DUX.
INSTALL?=		install
INSTALL_INFO?=		install-info
MAKE_PROGRAM?=		make
AWK?=			awk
XMKMF?=			xmkmf
SETENV?=		env
LN?=			ln -s
UNLINK?=		unlink
SED?=			sed
GREP?=			grep
SORT?=			sort
UNIQ?=			uniq
CP?=			cp
MV?=			mv
CHMOD?=			chmod
RPM2CPIO?=		rpm2cpio

ifneq (,${MODULESHOME})
MODULE_ADD?=		. $$MODULESHOME/init/sh; \
			module add
else
$(warn "Need modules to function properly!")
MODULE_ADD?=		echo "No modules support, skipping:"
endif

#
# Define Compiler suite profiles
#
ifeq (gnu,$(COMPILERS))
ENVIRONMENT+= CC=gcc
ENVIRONMENT+= CXX=g++
ENVIRONMENT+= F77=gfortran
ENVIRONMENT+= F90=gfortran
ENVIRONMENT+= FC=gfortran
COMPILER_TAG?=-gnu
endif
ifeq (pgi,$(COMPILERS))
ENVIRONMENT+= CC=pgcc
ENVIRONMENT+= CXX=pgCC
ENVIRONMENT+= F77=pgf77
ENVIRONMENT+= F90=pgf90
ENVIRONMENT+= FC=pgf90
COMPILER_TAG?=-pgi
endif
ifeq (intel,$(COMPILERS))
ENVIRONMENT+= CC=icc
ENVIRONMENT+= CXX=icpc
ENVIRONMENT+= F77=ifort
ENVIRONMENT+= F90=ifort
ENVIRONMENT+= FC=ifort
COMPILER_TAG?=-intel
endif
ifeq (pathscale,$(COMPILERS))
ENVIRONMENT+= CC=pathcc
ENVIRONMENT+= CXX=pathCC
ENVIRONMENT+= F77=pathf77
ENVIRONMENT+= FC=pathf95
COMPILER_TAG?=-pathscale
endif
ifeq (open64,$(COMPILERS))
ENVIRONMENT+= CC=opencc
ENVIRONMENT+= CXX=openCC
ENVIRONMENT+= F77=openf90
ENVIRONMENT+= F90=openf90
ENVIRONMENT+= FC=openf95
COMPILER_TAG?=-open64
endif


#
# Common places
#

MASTER_SITE_GNU?=	ftp://ftp.stacken.kth.se/pub/gnu/ \
			ftp://ftp.sunet.se/pub/gnu/ \
			ftp://ftp.gnu.org/pub/gnu/
MASTER_SITE_GNU_ALPHA?=	ftp://ftp.stacken.kth.se/pub/gnu-alpha/gnu/ \
			ftp://alpha.gnu.org/gnu/
MASTER_SITE_SOURCEFORGE?= http://prdownloads.sourceforge.net/ \
			ftp://ftp.sourceforge.net/pub/sourceforge/ \
			ftp://ftp2.sourceforge.net/pub/sourceforge/ \
			ftp://ftp3.sourceforge.net/pub/sourceforge/
MASTER_SITE_X11_CONTRIB?= ftp://ftp.sunet.se/pub/X11/contrib/ \
			ftp://ftp.ludd.luth.se/pub/X11/contrib/ \
			ftp://ftp.ntnu.no/pub/X11/contrib/ \
			ftp://ftp.duke.edu/pub/X11/contrib/ \
			ftp://fddisunsite.oit.unc.edu/pub/X11/contrib/
MASTER_SITE_GNOME?=	ftp://ftp.sunet.se/pub/X11/GNOME/ \
			ftp://ftp.gnome.org/pub/GNOME/

#
#
#

EXTRACT_SUFX?= .tar.gz

#
# To make make write commands as they are executed set VERBOSE to yes at
# your command-line
#

VERBOSE?=               no

ifeq ($(VERBOSE),no)
 QUIET=                 @
else
 QUIET=
endif

# Find the entry in $(SUBDIRS) that seems to be the latest version.
#  "You're not supposed to understand this."
# This will pick 1.17.19 before 1.17.19pre6. If it's not correct,
# in some case, either define LATEST or define SUBDIRS.

LATEST_VERSION=	\
	((for version in $(1); do \
		if (echo $$version | grep >/dev/null pre) || \
		   (echo $$version | grep >/dev/null beta); \
			then : ; \
		else \
			echo $$version | awk '{ FS="." }{ printf "%20s\.%20s\.%20s\.%20s          ---'"$$version"'\n", $$1, $$2, $$3, $$4; } '; \
		fi; \
	done) | sort -r; \
	(for version in $(1); do \
		if (echo $$version | grep >/dev/null pre) || \
		   (echo $$version | grep >/dev/null beta); \
		then \
			echo $$version | awk '{ FS="." }{ printf "%20s\.%20s\.%20s\.%20s          ---'"$$version"'\n", $$1, $$2, $$3, $$4; } '; \
		fi; \
	done;) | sort -r) \
	| head -1 | sed "s,.*---,,"

LATEST_VERSION_CODE=	\
	((for version in $$versions; do \
		if (echo $$version | grep >/dev/null pre) || \
		   (echo $$version | grep >/dev/null beta); \
			then : ; \
		else \
			echo $$version | awk '{ FS="." }{ printf "%20s\.%20s\.%20s\.%20s          ---'"$$version"'\n", $$1, $$2, $$3, $$4; } '; \
		fi; \
	done) | sort -r; \
	(for version in $$versions; do \
		if (echo $$version | grep >/dev/null pre) || \
		   (echo $$version | grep >/dev/null beta); \
		then \
			echo $$version | awk '{ FS="." }{ printf "%20s\.%20s\.%20s\.%20s          ---'"$$version"'\n", $$1, $$2, $$3, $$4; } '; \
		fi; \
	done;) | sort -r) \
	| head -1 | sed "s,.*---,,"

# This code is broken.
FIND_LATEST_VERSION= \
	(while read version; do \
		echo $$version | \
		awk '{ FS="." }{ printf "%-20s\.%-20s\.%-20s\.%-20s", $$1, $$2, $$3, $$4; } ' | \
		sed 's, ,z,g' | \
		sed 's,\(\\.[0-9]*\)\([a-zA-Z][a-zA-Z]*\),\\1.\\2,g' | \
		sed "s,.*,&        ---$$version,"; \
	done) | sort -r | head -1 | sed 's,.*---,,'

