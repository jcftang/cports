#; \ Copyright (c) 2000 Kungliga Tekniska Högskolan
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
# $Id: gnu.mpkg.mk,v 1.181 2002/02/20 09:21:18 abo Exp $
#

MPKGDIR=	$(shell while [ ! -f mk/gnu.post.mk ]; do cd ..; done; pwd)

include $(MPKGDIR)/mk/gnu.def.mk
include $(MPKGDIR)/mk/gnu.pre.mk
include $(MPKGDIR)/mk/gnu.information.mk


# What file to download and how to find the files in the archive.

# PKGNAME is obsoletete. Use PKGFILENAME or PKGSUBDIR instead.
PKGNAME?=		$(DISTNAME)-$(VERSION)
PKGFILENAME?=		$(PKGNAME)
PKGSUBDIR?=		$(PKGNAME)
DISTFILES?=		$(PKGFILENAME)$(EXTRACT_SUFX)


# Where to extract archives and build the package.

# If you want to build the package outside the mpkg-tree use
# WORKDIRPREFIX to set to the location where you want to build.
# If you end WORKDIRPREFIX with a slash, some packages that build
# sub-packages (for example perl) will leave directories behind when
# you have done a make clean.
# An example of a good WORKDIRPREFIX is '/tmp/${USER}'.

ifndef WORKDIRPREFIX
WORKDIR?=	$(CURDIR)/work
else
WORKDIR?=	$(WORKDIRPREFIX)/$(DISTNAME)-$(VERSION)
endif

# If you inside the a package want to do several parallell builds and make
# sure their specific build-cookies do not collide use WORKDIRSUFFIX.
#  (e.g. building both shared and static versions of a package that
#   do not support this natively (e.g. krb4-1.0.6))
ifdef WORKDIRSUFFIX
WORKDIR:=	$(WORKDIR)-$(WORKDIRSUFFIX)
endif

# Don't set WRKSRC unless absolutely neccerary. Use PKGSUBDIR instead.
# Note especially that setting WRKSRC instead of PKGSUBDIR
# will get you the wrong CONFIGURE_SCRIPT.
WRKSRC?=		$(WORKDIR)/$(PKGSUBDIR)

# File created when a target is done.

MPKG_DEPENDS?=		$(WORKDIR)/.mpkg_depends
CHECK_COOKIE?=		$(WORKDIR)/.check_done
DEPENDS_COOKIE?=	$(WORKDIR)/.depends_done
BUILD_COOKIE=		$(WORKDIR)/.build_done
TEST_COOKIE=		$(WORKDIR)/.test_done
CONFIGURE_COOKIE=	$(WORKDIR)/.configure_done
FETCH_COOKIE=		$(WORKDIR)/.fetch_done
EXTRACT_COOKIE=		$(WORKDIR)/.extract_done
PATCH_COOKIE=		$(WORKDIR)/.patch_done
INSTALL_COOKIE=		$(WORKDIR)/.install_done
PACKAGE_COOKIE=		$(WORKDIR)/.package_done
MODULE_COOKIE=		$(WORKDIR)/.module_done
MENUDEFS_COOKIE=	$(WORKDIR)/.menudefs_done
INFORMATION_COOKIE=	$(WORKDIR)/.information_done
HTML_COOKIE=		$(WORKDIR)/.html_cookie_done
MARKDOWN_COOKIE=	$(WORKDIR)/.markdown_cookie_done
INSTALL_DEPENDS_COOKIE=	$(WORKDIR)/.install_depends_done


# This file contains some variables that we need.
# If it doesn't exist, it will be created and a
# new make process will be started to make sure
# that it gets loaded.

sinclude $(MPKG_DEPENDS)

# Parents file. Should be a for-loop.
ifdef PARENT_MPKG_DEPENDS
ifdef DEPENDS_DONE
sinclude $(PARENT_MPKG_DEPENDS)
endif
endif


# run tests?
DO_RUN_TESTS?=    no

# Which downloaded files are archives?

EXTRACT_ONLY?=		$(DISTFILES)


# Where to install the package.

PROGRAM_PREFIX?=	$(PREFIX)/$(COMPILERS)/$(DISTNAME)/$(VERSION)$(EXTRAVERSION)


# Where to look for other packages

PREFIX_PATH?=	$(PREFIX)/$(COMPILERS)/


# What targets to build in the package's own Makefile
# and which Makefile that is.

ALL_TARGET?=		all
INSTALL_TARGET?=	install
TEST_TARGET?=          check
MAKEFILE?=		Makefile


# Try to configure Imake in a reasonable fashion.

ifdef USE_IMAKE
ifndef NO_INSTALL_MANPAGES
INSTALL_TARGET+=	install.man
endif # !NO_INSTALL_MANPAGES
ifneq (,$(findstring linux,$(SYSTEM_TYPE_OS)))
IMAKE_CONFDIR?=		/usr/X11R6/lib/X11/config
IMAKE_CPP_ARGS+=	-DBourneShell=/bin/bash
IMAKE_CPP_ARGS+=	-DBuildHtmlManPages=NO
IMAKE_CPP_ARGS+=	-DHasGnuMake=YES
ifdef NO_INSTALL_MANPAGES
IMAKE_CPP_ARGS+=	-DProgramTargetHelper=ProgramTargetHelperNoMan
endif # NO_INSTALL_MANPAGES
endif # linux
ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
IMAKE_CONFDIR?=		/usr/lib/X11/config
IMAKE_CPP_ARGS+=	-DBourneShell=/sbin/bash
IMAKE_CPP_ARGS+=	-DDefaultCCOptions='-std1 -w1'
IMAKE_CPP_ARGS+=	-DArCmd='ar cq'
endif # osf
ifneq (,$(findstring solaris,$(SYSTEM_TYPE_OS)))
IMAKE_CONFDIR?=		/usr/openwin/lib/config
IMAKE_CPP_ARGS+=	-DInstallCmd='$(INSTALL)'
endif # solaris
IMAKE_CPP_ARGS+=	-DUseSeparateConfDir=NO
IMAKE_CPP_ARGS+=	-DUNCOMPRESSPATH=/usr/bin/uncompress
IMAKE_CPP_ARGS+=	-DHasFlex -DLexCmd=flex -DLexLib=-lfl
IMAKE_CPP_ARGS+=	-DManPath=$(PROGRAM_PREFIX)/man
IMAKE_CPP_ARGS+=	-DManSuffix=1 -DLibManSuffix=3
IMAKE_CPP_ARGS+=	-DDriverManSuffix=4 -DFileManSuffix=5
IMAKE_CPP_ARGS+=	-DXAppLoadDir=$(PROGRAM_PREFIX)/app-defaults
IMAKE_CPP_ARGS+=	-DExtraLoadFlags='$(CC_LD_FLAGS)'
endif # USE_IMAKE

#
# Try to find icons that match the menu-commands
#
ifdef BASE_ICONPATH
ifndef NORMALICON
ifneq (,$(wildcard $(BASE_ICONPATH:=/reduced/48x48/$(DISTNAME).xpm)))
NORMALICON=	$(DISTNAME).xpm
endif # Icon found in path
endif # NORMALICON
ifndef MINIICON
ifneq (,$(wildcard $(BASE_ICONPATH:=/reduced/14x14/mini.$(DISTNAME).xpm)))
MINIICON=	mini.$(DISTNAME).xpm
endif # Icon found in path
endif # MINIICON
endif # BASE_ICONDIR

# SOURCEDIR is to SRCDIR what WORKDIR is to WRKSRC. To keep
# consistency it should probably be called SRCSRC :-)

ifdef INSTALL_SOURCE
ifndef GNU_CONFIGURE
$(error "Pointless to use INSTALL_SOURCE without GNU_CONFIGURE")
endif
SOURCEDIR=$(PROGRAM_PREFIX)/src
else
SOURCEDIR=$(WORKDIR)
endif

SRCDIR=$(SOURCEDIR)/$(PKGSUBDIR)

ifdef GNU_CONFIGURE
HAS_CONFIGURE=		YES
CONFIGURE_ARGS+=	--host $(SYSTEM_TYPE) --build $(SYSTEM_TYPE) --prefix=$(PROGRAM_PREFIX)
CONFIGURE_SCRIPT?=	$(SRCDIR)/configure
endif

ifdef USE_LIBTOOL
DEPENDS+=	"libtool --build-env"
endif
# This system comes with a gcc, so we might as well upgrade it
# and avoid the broken so-called gcc-2.96 on RedHat systems.
ifeq (yes,$(shell type gcc >/dev/null 2>&1 && echo yes))
ifeq (no,$(shell for foo in BLAH $(DEPENDS); do echo "$$foo"; done|grep '^gcc/*' || echo no))
#DEPENDS+=	"gcc --build-env --cond"
endif
endif

# Each package has its own distribution directory nowadays.
#  XXX Rename to PKG_DIST...?
_DISTDIR?=		$(DISTDIR)/$(DISTNAME)
#_DISTDIR?=		$(DISTDIR)/$(DISTNAME)/$(VERSION)
_DISTFILES?=		$(DISTFILES)
_PATCHFILES?=		$(PATCHFILES)


# How to extract archives
DOWNLOADED_DISTFILE=	$(_DISTDIR)/$$file
EXTRACT_CMD?=		$$decompress_cmd $(_DISTDIR)/$$file | $(TAR_EXTRACT) $(EXTRACT_ELEMENTS)
#  If this is empty, then everything gets extracted.
EXTRACT_ELEMENTS?=	


# Look for patch files in this directory.

PATCHDIR?=		$(CURDIR)/patches


# How to apply patch files.

PATCH_STRIP?=		-p0
PATCH_DIST_STRIP?=	-p0
PATCH_ARGS?=		-d $(SRCDIR) -N -s -E $(PATCH_STRIP)
PATCH_DIST_ARGS?=	-d $(SRCDIR) -N -s -E $(PATCH_DIST_STRIP)

TOUCH_FLAGS?=		-f


#
# Set up the environment to use during configure, build and install.
#

# This is a kludge, but we want each libdir only once
UNIQ_LINK_PATHS=	$(shell for foo in $(LINK_PATHS) ""; do echo $$foo; done | sort -u | /usr/bin/tr "\n" " "; echo "")

#  The C pre-processor flags. (-I)
CPP_FLAGS+=		$(INCLUDE_PATHS:%=-I%)
ENVIRONMENT+=		CPPFLAGS="${CPPFLAGS} $(CPP_FLAGS)"

#  The C compiler flags. (-L)
LD_FLAGS+=		$(UNIQ_LINK_PATHS:%=-L%)

#  The linker flags. (-rpath)
#  (Needed because on som architectures -L will not imply -rpath.)

# XXX autoconf
#ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
NO_AUTO_DYNAMIC_LINK_PATHS=	yes
#endif

ifdef LINK_PATHS
ifdef NO_AUTO_DYNAMIC_LINK_PATHS

LD_RPATH_LIST=		$(shell (for foo in $(UNIQ_LINK_PATHS) ""; do if ls $$foo/*.so* 2> /dev/null > /dev/null || test "$$foo" = "$(PROGRAM_PREFIX)/lib" ; then echo $$foo; fi; done | /usr/bin/tr "\n" ":"; echo "") | sed -e "s;:*$$;;")

# XXX autoconf
ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
ifneq (,$(LD_RPATH_LIST))
CC_LD_FLAGS+=		-Wl,-rpath,$(LD_RPATH_LIST)
endif
else
ifneq (,$(findstring linux,$(SYSTEM_TYPE_OS)))
CC_LD_FLAGS+=		$(UNIQ_LINK_PATHS:%=-Wl,-rpath,%)
else
ifneq (,$(findstring solaris,$(SYSTEM_TYPE_OS)))
# man page for gnu ld says it's -rpath but -R works as well,
# but -rpath doesn't work...
CC_LD_FLAGS+=		$(UNIQ_LINK_PATHS:%=-R%)
else
# Assume GNU-style.
CC_LD_FLAGS+=		$(UNIQ_LINK_PATHS:%=-Wl,-rpath,%)
endif # Solaris
endif # NO_AUTO_DYNAMIC_LINK_PATHS
endif # LINK_PATHS

ENVIRONMENT+=		LDFLAGS="${LDFLAGS} $(CC_LD_FLAGS) $(LD_FLAGS)"
ENVIRONMENT+=		LD_RUN_PATH=$(LD_RPATH_LIST)
ENVIRONMENT+=		LD_LIBRARY_PATH=$(LD_RPATH_LIST)

endif
endif

#  Some packages depend on these being set.
ENVIRONMENT+=		PREFIX=$(PROGRAM_PREFIX) X11BASE=$(X11BASE)

MAKE_ENV+=		$(ENVIRONMENT)
CONFIGURE_ENV+=		$(ENVIRONMENT)

#  Don't pass these on from mpkg.

MAKE_ENV+=		MAKEFLAGS=


# Could be useful.

INSTALL_PROGRAM?= \
	$(INSTALL) $(COPY) $(STRIPFLAG) -o $(BINOWN) -g $(BINGRP) -m $(BINMODE)
INSTALL_SCRIPT?= \
	$(INSTALL) $(COPY) -o $(BINOWN) -g $(BINGRP) -m $(BINMODE)
INSTALL_DATA?= \
	$(INSTALL) $(COPY) -o $(SHAREOWN) -g $(SHAREGRP) -m $(SHAREMODE)
INSTALL_MAN?= \
	$(INSTALL) $(COPY) -o $(MANOWN) -g $(MANGRP) -m $(MANMODE)
INSTALL_PROGRAM_DIR?= \
	$(INSTALL) -d -o $(BINOWN) -g $(BINGRP) -m $(BINMODE)
INSTALL_SCRIPT_DIR?= \
	$(INSTALL_PROGRAM_DIR)
INSTALL_DATA_DIR?= \
	$(INSTALL) -d -o $(SHAREOWN) -g $(SHAREGRP) -m $(BINMODE)
INSTALL_MAN_DIR?= \
	$(INSTALL) -d -o $(MANOWN) -g $(MANGRP) -m $(BINMODE)

INSTALL_MACROS=	BSD_INSTALL_PROGRAM="$(INSTALL_PROGRAM)" \
			BSD_INSTALL_SCRIPT="$(INSTALL_SCRIPT)" \
			BSD_INSTALL_DATA="$(INSTALL_DATA)" \
			BSD_INSTALL_MAN="$(INSTALL_MAN)" \
			BSD_INSTALL_PROGRAM_DIR="$(INSTALL_PROGRAM_DIR)" \
			BSD_INSTALL_SCRIPT_DIR="$(INSTALL_SCRIPT_DIR)" \
			BSD_INSTALL_DATA_DIR="$(INSTALL_DATA_DIR)" \
			BSD_INSTALL_MAN_DIR="$(INSTALL_MAN_DIR)"
MAKE_ENV+=	$(INSTALL_MACROS)
SCRIPTS_ENV+=	$(INSTALL_MACROS)	# XXX What variable?


# This is the command to run to start the package from a menu, if it
# is interactive.

MENU_COMMANDS?=	STANDARD

MENU_COMMAND_MENUTEXT_STANDARD=	$(DISTNAME)
MENU_COMMAND_MENUTEXT_TERMINAL=	$(DISTNAME)
# It should be in the PATH, but maybe not first.
#  XXX Should we have a '?' there?
MENU_COMMAND_CMD_STANDARD?=	$(PROGRAM_PREFIX)/bin/$(DISTNAME)
MENU_COMMAND_CMD_TERMINAL?=	xterm -e $(MENU_COMMAND_CMD_STANDARD)

#
# Helper functions
#

_FETCH_FILE =								\
	if [ ! -f $$file -a ! -f $$bfile -a ! -h $$bfile ]; then	\
		$(ECHO_MSG) "=> $$bfile doesn't exist on this system.";	\
		for site in $$sites; do					\
			$(ECHO_MSG) "=> Attempting to fetch $$bfile from $$site.";\
			if $(FETCH) $(FETCH_PRE_ARG) $$site/$$bfile $(FETCH_POST_ARG); then \
				$(ECHO_MSG) "=> Got it";		\
				: XXX check checksum ;			\
				continue 2;				\
			else						\
				$(ECHO_MSG) "=> Fetch failed for $$site";\
			fi						\
		done;							\
		$(ECHO_MSG) "=> Couldn't fetch the file $$bfile";		\
		$(ECHO_MSG) "=> Try it yourself and put it in $(_DISTDIR)";\
		exit 1;							\
	fi


# cat a file, but remove all lines before the first line that
# begins with "--- "
_DROP_CREDITS=								\
	while read foo; do echo $$foo | grep "^--- " && cat; done

_PATCH_FILE=								\
	cd $$patch_distdir &&						\
	for i in $(PATCHFILES); do					\
		case $$i in 						\
			*.Z|*.gz)					\
				$(GZCAT) $$i | $(_DROP_CREDITS) | 	\
				$(PATCH) $(PATCH_DIST_ARGS)		\
				|| ( $(ECHO) "Patch $$i failed"; exit 1); \
				;;					\
			*)						\
				$(CAT) $$i  | $(_DROP_CREDITS) | 	\
				$(PATCH) $(PATCH_DIST_ARGS)		\
				|| ( $(ECHO) "Patch $$i failed"; exit 1); \
				;;					\
		esac;							\
	done



# dependencies stage:
#   * Make a list of not installed packages.
#   * Set some other variables.

$(MPKG_DEPENDS):
	$(QUIET) $(MKDIR) $(WORKDIR)
	$(QUIET) > $(MPKG_DEPENDS)
ifdef DEPENDS
	$(QUIET) \
	rdeps=""; \
	for dep in $(DEPENDS); do \
	    for deppart in $$dep; do \
		rdeps="$$deppart $$rdeps"; \
	    done; \
	done; \
	for dep in $$rdeps; do \
	    if $(ECHO) $$dep | $(GREP) >/dev/null ":"; then \
		$(ECHO) "Sub-packages and short options in DEPENDS not supported yet."; \
		exit 1; \
	    fi; \
	    unset is_an_opt; \
	    if $(TEST) "$$dep" = "--cond"; then \
		opt_cond=yes; \
		is_an_opt=yes; \
	    fi; \
	    if $(TEST) "$$dep" = "--lib"; then \
		opt_lib=yes; \
		is_an_opt=yes; \
	    fi; \
	    if $(TEST) "$$dep" = "--build-env"; then \
		opt_build_env=yes; \
		is_an_opt=yes; \
	    fi; \
	    if $(TEST) "$$dep" = "--run-env"; then \
		opt_run_env=yes; \
		is_an_opt=yes; \
	    fi; \
	    if $(TEST) "X$$is_an_opt" = "X"; then \
		unset found_dir; \
		for prefix in $(PREFIX_PATH); do \
		    if [ "X$$found_dir" = "X" ]; then \
			: no-op; \
		    else \
			continue; \
		    fi; \
		    if $(TEST) -d $$prefix/$$dep; then \
			if [ -f "$$prefix"/"$$dep"/.mpkg_depends ]; then \
			    found_prefix=$$prefix; \
			    found_dir=$$dep; \
			else \
			    if [ -f "$$prefix"/"$$dep"/current/.mpkg_depends ]; then \
				found_prefix=$$prefix; \
				found_dir=$$dep/`(cd $$prefix; \
				ls -l $$dep/current | \
				$(SED) "s,.* -> $$prefix/[^/]*/,," | \
				$(SED) "s,.* -> ,,")`; \
			    else \
				if ($(ECHO) $$prefix/$$dep/*/.mpkg_depends | $(GREP) >/dev/null "\*"); then \
				    : no-op; \
				else \
				    found_prefix=$$prefix; \
				    if [ -f ../../"$$dep"/Makefile ] && grep >/dev/null subdir.mk ../../$$dep/Makefile; then \
					found_dir=`cd ../../$$dep && $(MAKE) show-latest|fgrep 'latest:'|sed 's,latest: ,,'`; \
					found_dir=$$dep/$$found_dir; \
					if [ -d $$prefix/$$found_dir ]; then \
					    : ok ; \
					else \
					    missing_depends="$$dep $$missing_depends"; \
					fi; \
				    else \
					versions=`(cd $$prefix; \
					ls $$dep/*/.mpkg_depends | \
					$(SED) "s,/.mpkg_depends,,")`; \
					found_dir=`$(LATEST_VERSION_CODE)`; \
				    fi; \
				fi; \
			    fi; \
			fi; \
		    fi; \
		    found_module="$$found_dir-$(COMPILERS)" ; \
		    if [ -f "$$prefix" ]; then \
			if cat "$$prefix" | \
			   grep >/dev/null "^$$dep"; then \
			    found_prefix=`echo $$prefix | $(SED) "s,/[^/]*/[^/]*/[^/]*$$,,"`; \
			    found_dir=`echo $$prefix | $(SED) "s,.*/\([^/]*/[^/]*\)/[^/]*$$,\1,"`; \
			    found_module=$$found_dir; \
			fi; \
		    fi; \
		done; \
		if [ "X$$found_dir" = "X" ]; then \
		    if [ "X$$opt_cond" != "Xyes" ]; then \
			missing_depends="$$dep $$missing_depends"; \
		    fi \
		else \
		    shortname=`$(ECHO) $$dep | $(SED) "s,/.*,,"`; \
		    $(ECHO) >>$(MPKG_DEPENDS) PREFIX_$$shortname=$$found_prefix/$$found_dir; \
		    if [ "X$$opt_lib" = "Xyes" ]; then \
			$(ECHO) >>$(MPKG_DEPENDS) LINK_DEPENDS+=$$found_module; \
			$(ECHO) >>$(MPKG_DEPENDS) LINK_PATHS+=$$found_prefix/$$found_dir/lib; \
			$(ECHO) >>$(MPKG_DEPENDS) LINK_PATHS+=$$found_prefix/$$found_dir/lib64; \
			if [ -f "$$found_prefix"/"$$found_dir"/.mpkg_depends ] ; then \
			    if [ "`grep '^LINK_PATHS+=.*PREFIX_' $$found_prefix/$$found_dir/.mpkg_depends `" ] ; then \
				: Obsolete LINK_PATH format, rebuild ; \
				$(ECHO_MSG) "=> Packet $$dep has an obsolete .mpkg_depends file."; \
				missing_depends="$$dep $$missing_depends"; \
			    else \
				grep "^LINK_PATHS+=" $$found_prefix/$$found_dir/.mpkg_depends \
				>> $(MPKG_DEPENDS); \
			    fi; \
			fi; \
		    fi; \
		    if [ "X$$opt_lib" = "Xyes" ]; then \
			$(ECHO) >>$(MPKG_DEPENDS) INCLUDE_PATHS+=$$found_prefix/$$found_dir/include; \
		    fi; \
		    if [ "X$$opt_build_env" = "Xyes" ]; then \
			$(ECHO) >>$(MPKG_DEPENDS) BUILD_DEPENDS+=$$found_module; \
		    fi; \
		    if [ "X$$opt_run_env" = "Xyes" ]; then \
			$(ECHO) >>$(MPKG_DEPENDS) RUN_DEPENDS+=$$found_module; \
		    fi; \
		    : why did i write this? ; \
		    if [ "X$$opt_lib" = "Xyes" -o "X$$opt_run_env" = "Xyes" ]; then \
			$(ECHO) >>$(MPKG_DEPENDS) MODULE_DEPENDS+=$$found_dir; \
		    fi; \
		fi; \
		unset opt_cond; \
		unset opt_lib; \
		unset opt_build_env; \
		unset opt_run_env; \
	    fi; \
	done; \
	if [ "X$$missing_depends" = "X" ]; then \
	    echo DEPENDS_DONE=yes >> $(MPKG_DEPENDS); \
	else \
	    $(ECHO) >>$(MPKG_DEPENDS) MISSING_DEPENDS="$$missing_depends"; \
	fi
else
	$(QUIET) echo DEPENDS_DONE=yes >> $(MPKG_DEPENDS);
endif
	$(QUIET) # Do some general dependencies too
	$(QUIET) $(foreach prefix,$(PREFIX_PATH), \
	if type >/dev/null 2>&1 $(WGET); then \
	    : no-op; \
	else \
	    if $(TEST) -f $(prefix)/wget/current/bin/wget; then \
		echo WGET=$(prefix)/wget/current/bin/wget >> $(MPKG_DEPENDS); \
	    else \
		if $(TEST) -f $(prefix)/bootstrap/wget/current/bin/wget; then \
		    echo WGET=$(prefix)/bootstrap/wget/current/bin/wget >> $(MPKG_DEPENDS); \
		fi; \
	    fi; \
	fi;)
	$(QUIET) \
	$(foreach prefix,$(PREFIX_PATH), \
	if type >/dev/null 2>&1 $(GTAR); then \
	    : no-op; \
	else \
	    if $(TEST) -f $(prefix)/gtar/current/bin/gtar; then \
		echo GTAR=$(prefix)/gtar/current/bin/gtar >> $(MPKG_DEPENDS); \
	    else \
		if $(TEST) -f $(prefix)/bootstrap/gtar/current/bin/gtar; then \
		    echo GTAR=$(prefix)/bootstrap/gtar/current/bin/gtar >> $(MPKG_DEPENDS); \
		fi; \
	    fi; \
	fi;)
	$(QUIET) \
	$(foreach prefix,$(PREFIX_PATH), \
	if type >/dev/null 2>&1 $(CPIO); then \
	    : no-op; \
	else \
	    if $(TEST) -f $(prefix)/cpio/current/bin/cpio; then \
		echo CPIO=$(prefix)/cpio/current/bin/cpio >> $(MPKG_DEPENDS); \
	    else \
		if $(TEST) -f $(prefix)/bootstrap/cpio/current/bin/cpio; then \
		    echo CPIO=$(prefix)/bootstrap/cpio/current/bin/cpio >> $(MPKG_DEPENDS); \
		fi; \
	    fi; \
	fi;)
	$(QUIET) \
	$(foreach prefix,$(PREFIX_PATH), \
	if type >/dev/null 2>&1 $(UNZIP); then \
	    : no-op; \
	else \
	    if $(TEST) -f $(prefix)/unzip/current/bin/unzip; then \
		echo UNZIP=$(prefix)/unzip/current/bin/unzip >> $(MPKG_DEPENDS); \
	    else \
		if $(TEST) -f $(prefix)/bootstrap/unzip/current/bin/unzip; then \
		    echo UNZIP=$(prefix)/bootstrap/unzip/current/bin/unzip >> $(MPKG_DEPENDS); \
		fi; \
	    fi; \
	fi;)
	$(QUIET) \
	$(foreach prefix,$(PREFIX_PATH), \
	if type >/dev/null 2>&1 $(BZIP2); then \
	    : no-op; \
	else \
	    if $(TEST) -f $(prefix)/bzip2/current/bin/bzip2; then \
		echo BZIP2=$(prefix)/bzip2/current/bin/bzip2 >> $(MPKG_DEPENDS); \
	    else \
		if $(TEST) -f $(prefix)/bootstrap/bzip2/current/bin/bzip2; then \
		    echo BZIP2=$(prefix)/bootstrap/bzip2/current/bin/bzip2 >> $(MPKG_DEPENDS); \
		fi; \
	    fi; \
	fi;)
	$(QUIET) \
	$(foreach prefix,$(PREFIX_PATH), \
	if $(TEST) -f $(PREFIX)/patch/current/bin/patch; then \
	    echo PATCH=$(PREFIX)/patch/current/bin/patch >> $(MPKG_DEPENDS); \
	else \
	    if $(TEST) -f $(prefix)/patch/current/bin/patch; then \
		echo PATCH=$(prefix)/patch/current/bin/patch >> $(MPKG_DEPENDS); \
	    else \
		if $(TEST) -f $(prefix)/bootstrap/patch/current/bin/patch; then \
		    echo PATCH=$(prefix)/bootstrap/patch/current/bin/patch >> $(MPKG_DEPENDS); \
		fi; \
	    fi; \
	fi;)
	$(QUIET) \
	$(foreach prefix,$(PREFIX_PATH), \
	if type >/dev/null 2>&1 $(INSTALL_INFO); then \
	    : no-op; \
	else \
	    if $(TEST) -f $(prefix)/texinfo/current/bin/install-info; then \
		echo INSTALL_INFO=$(prefix)/texinfo/current/bin/install-info >> $(MPKG_DEPENDS); \
	    else \
		if $(TEST) -f $(prefix)/bootstrap/texinfo/current/bin/install-info; then \
		    echo INSTALL_INFO=$(prefix)/bootstrap/texinfo/current/bin/install-info >> $(MPKG_DEPENDS); \
		fi; \
	    fi; \
	fi;)
	$(QUIET) $(MV) $(MPKG_DEPENDS) $(MPKG_DEPENDS).long
	$(QUIET) touch $(MPKG_DEPENDS)
	$(QUIET) cat $(MPKG_DEPENDS).long | \
	while read line; do \
	    fgrep >/dev/null 2>&1 "$$line" $(MPKG_DEPENDS) || \
	    echo "$$line" >>$(MPKG_DEPENDS); \
	    if [ "`sort -u $(MPKG_DEPENDS).long | wc -l`" -eq \
	         "`sort -u $(MPKG_DEPENDS) | wc -l`" ]; then \
		break; \
	    fi; \
	done


# 
# install depends stage:
#

$(INSTALL_DEPENDS_COOKIE): $(MPKG_DEPENDS)
	$(QUIET) $(MAKE) do-install-depends
	$(QUIET) touch $(INSTALL_DEPENDS_COOKIE)


# 
# depends stage:
#

$(DEPENDS_COOKIE): $(MPKG_DEPENDS)
	$(QUIET) $(MAKE) do-depends
	$(QUIET) touch $(DEPENDS_COOKIE)


# 
# configure stage:
#

$(CONFIGURE_COOKIE):
	$(QUIET) $(MAKE) do-configure
	$(QUIET) touch $(CONFIGURE_COOKIE)


#
# build stage
#

$(BUILD_COOKIE):
	$(QUIET) if [ "X$(NO_BUILD)" = "X" ]; then \
		$(MAKE) do-build; \
	fi
	$(QUIET) touch $(BUILD_COOKIE)


#
# check stage
#

$(CHECK_COOKIE):
	$(QUIET) $(MKDIR) $(WORKDIR); \
	$(MAKE) do-check
	$(QUIET) touch $(CHECK_COOKIE)


# 
# test stage:
#

$(TEST_COOKIE):
	 if [ "X$(DO_RUN_TESTS)" = "Xyes" ]; then  \
	           $(MAKE) do-test; \
	fi
	touch $(TEST_COOKIE)


#
# fetch stage
#

$(FETCH_COOKIE):
	$(QUIET) $(MKDIR) $(WORKDIR); \
	$(MAKE) do-fetch
	$(QUIET) touch $(FETCH_COOKIE)


#
# patch stage
#

$(PATCH_COOKIE):
	$(QUIET) $(MAKE) do-patch
	$(QUIET) touch $(PATCH_COOKIE)


#
# extract stage
#

$(EXTRACT_COOKIE):
	$(QUIET) $(MAKE) do-extract
	$(QUIET) touch $(EXTRACT_COOKIE)


#
# install stage
#

$(INSTALL_COOKIE):
	$(QUIET) $(MAKE) do-install do-install-info do-post
	$(QUIET) if [ -f $(MPKG_DEPENDS) -a -d $(PROGRAM_PREFIX) ]; then \
	  $(CP) $(MPKG_DEPENDS) $(PROGRAM_PREFIX); \
	fi
	$(QUIET) touch $(INSTALL_COOKIE)


#
# package stage?
#

$(PACKAGE_COOKIE):
	$(QUIET) $(MAKE) do-package


#
# module install stage
#

$(MODULE_COOKIE):
	$(QUIET) $(MAKE) do-module
	$(QUIET) touch $(MODULE_COOKIE)


#
# menu definitions install stage
#

$(MENUDEFS_COOKIE):
	$(QUIET) $(MAKE) do-menudefs
	$(QUIET) touch $(MENUDEFS_COOKIE)


#
# information install stage
#

$(INFORMATION_COOKIE):
	$(QUIET) $(MKDIR) $(WORKDIR)
	$(QUIET) $(MAKE) do-information

$(HTML_COOKIE):
	$(QUIET) $(MKDIR) $(WORKDIR)
	$(QUIET) $(MAKE) do-html

$(MARKDOWN_COOKIE):
	$(QUIET) $(MKDIR) $(WORKDIR)
	$(QUIET) $(MAKE) do-markdown
	$(QUIET) touch $(MARKDOWN_COOKIE)


#
# Show help message
#

help:
	$(QUIET) $(ECHO_MSG) $(HELP_MSG)

#
# Depencies between stages.
#

install:
	$(QUIET) \
	$(MAKE) extract && \
	$(MAKE) install-depends && \
	$(MAKE) build && \
	$(MAKE) test && \
	$(MAKE) install-program
	$(MAKE) install-post

check: $(CHECK_COOKIE)
fetch: check $(FETCH_COOKIE)
extract: fetch $(EXTRACT_COOKIE)
depends: $(DEPENDS_COOKIE)
patch: extract depends $(PATCH_COOKIE)
configure: patch $(CONFIGURE_COOKIE)
build: configure $(BUILD_COOKIE)
test: configure build $(TEST_COOKIE)
menudefs: $(MENUDEFS_COOKIE)
module: menudefs $(MODULE_COOKIE)
install-program: build $(INSTALL_COOKIE)
	$(QUIET) $(MAKE) module
	$(QUIET) $(MAKE) information
	$(QUIET) $(MAKE) markdown
information: depends $(INFORMATION_COOKIE)
html: depends $(HTML_COOKIE)
markdown: depends $(MARKDOWN_COOKIE) $(INFORMATION_COOKIE)
package: $(PACKAGE_COOKIE)
install-depends: $(INSTALL_DEPENDS_COOKIE)


#
# If there is a need for a version-independent path.
#

current:
	$(QUIET) $(MKDIR) $(PROGRAM_PREFIX) &&				\
	$(LN) -f $(PROGRAM_PREFIX) $(PREFIX)/$(COMPILERS)/$(DISTNAME)/current;	\
	$(MKDIR) $(PREFIX)/modulefiles/$(DISTNAME);			\
	$(ECHO) "#%Module"> $(PREFIX)/modulefiles/$(DISTNAME)/.version;	\
	$(ECHO) "set ModulesVersion \"$(VERSION)\"" >> $(PREFIX)/modulefiles/$(DISTNAME)/.version 
#	$(LN) -f $(MODULEDIR)/$(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) $(MODULEDIR)/$(DISTNAME)/current

uncurrent:
#	$(UNLINK) $(MODULEDIR)/$(DISTNAME)/current 
	$(UNLINK) $(PREFIX)/$(COMPILERS)/$(DISTNAME)/current;

uninstall:
	$(QUIET) $(ECHO_MSG)
	$(QUIET) $(ECHO_MSG) "Helper to uninstall, please remove these directories and files manually..."
	$(QUIET) $(ECHO_MSG)
	$(QUIET) if [ -f $(MODULEDIR)/$(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) ]; then \
		$(ECHO_MSG) "$(RM_RI) $(MODULEDIR)/$(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG)" ; \
	fi
	$(QUIET) if [ -d $(PROGRAM_PREFIX) ]; then \
		$(ECHO_MSG) "$(RM_RI) $(PROGRAM_PREFIX)" ; \
	fi
	$(QUIET) if [ -f $(MENUDEFSDIR)/$(DISTNAME)/$(VERSION)/menu.conf ] ; then \
		$(ECHO_MSG) "$(RM_RI) $(MENUDEFSDIR)/$(DISTNAME)/$(VERSION)/menu.conf"; \
	fi
	$(QUIET) if [ -f $(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk ] ; then \
		$(ECHO_MSG) "$(RM_RI) $(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk " ;\
	fi
	$(QUIET) $(ECHO_MSG)

#
# Will be used if your package don't have a target do-extract.
#

do-extrac%:
	$(QUIET) $(MKDIR) $(SOURCEDIR)
	$(QUIET) $(ECHO_MSG) "Extracting file(s) for $(DISTNAME)-$(VERSION)";	\
	umask 022 &&								\
	for file in "" $(EXTRACT_ONLY); do					\
		if [ "X$$file" = "X" ]; then continue; fi;			\
		case "$$file" in						\
			*[_.]tar.gz|*.tgz)					\
				decompress_cmd="$(GZCAT)";			\
				extract_cmd="$(TAR_EXTRACT)";			\
			;;							\
			*.gz)							\
				decompress_cmd="$(GUNZIP)";			\
				extract_cmd=none;				\
			;;							\
			*.tar.bz2)						\
				decompress_cmd="$(BZ2CAT)";			\
				extract_cmd="$(TAR_EXTRACT)";			\
			;;							\
			*.bz2)							\
				decompress_cmd="$(BUNZIP2)";			\
				extract_cmd=none;				\
			;;							\
			*.tar.Z)						\
				decompress_cmd="$(COMPRESSCAT)";		\
				extract_cmd="$(TAR_EXTRACT)";			\
			;;							\
			*.Z)							\
				decompress_cmd="$(UNCOMPRESS)";			\
				extract_cmd=none;				\
			;;							\
			*.tar)							\
				decompress_cmd="$(CAT)";			\
				extract_cmd="$(TAR_EXTRACT)";			\
			;;							\
			*.rpm)							\
				decompress_cmd="$(RPM2CPIO)";			\
				extract_cmd="$(CPIO_EXTRACT)";			\
			;;							\
			*.zip)							\
				decompress_cmd="$(UNZIP)";			\
				extract_cmd=none;				\
			;;							\
			*)							\
				decompress_cmd=none;				\
				extract_cmd=none;				\
			;;							\
		esac;								\
		if [ "$$extract_cmd" = "none" ]; then				\
			cp $(_DISTDIR)/$$file $(SOURCEDIR);			\
			if [ "$$decompress_cmd" = "none" ]; then		\
				: ;						\
			else							\
				(cd $(SOURCEDIR) && $$decompress_cmd $$file);	\
			fi;							\
		else								\
			(cd $(SOURCEDIR) && $$decompress_cmd $(_DISTDIR)/$$file | $$extract_cmd $(EXTRACT_ELEMENTS));	\
		fi;								\
	done


#
# Will be used if your package don't have a target do-fetch.
#

do-fetc%:
	$(QUIET) $(ECHO_MSG) "Fetching file(s) for $(DISTNAME)-$(VERSION)";		\
	$(MKDIR) $(_DISTDIR);						\
	cd $(_DISTDIR) &&						\
	sites="$(MASTER_SITES) $(LOCAL_DIST_SITE)";			\
	for file in "" $(_DISTFILES); do				\
		if [ "X$$file" = "X" ]; then continue; fi;		\
		bfile=`$(BASENAME) $$file`;				\
		$(_FETCH_FILE);						\
	done ;								\
	sites="$(PATCH_SITES) $(LOCAL_DIST_SITE)";			\
	for file in "" $(_PATCHFILES); do				\
		if [ "X$$file" = "X" ]; then continue; fi;		\
		bfile=`$(BASENAME) $$file`;				\
		$(_FETCH_FILE);						\
	done


#
# Will be used if your package don't have a target do-patch.
#

do-patc%:
ifdef PATCHFILES
	$(QUIET) $(ECHO_MSG) "Applying distribution patches for $(DISTNAME)-$(VERSION)"
	$(QUIET) patch_distdir=$(_DISTDIR);					\
	$(_PATCH_FILE)
endif
	$(QUIET) patchfiles="";						\
	if [ ! -d $(PATCHDIR) ]; then					\
		:;							\
	elif [ "`$(ECHO) $(PATCHDIR)/patch-*`" = "$(PATCHDIR)/patch-*" ];then \
		$(ECHO_MSG) "Ignoring empty patch dir";			\
	else								\
		patchfiles=`$(ECHO_MSG) $(PATCHDIR)/patch-*`;		\
	fi;								\
	if [ ! -d $(PATCHDIR)-$(SYSTYPE) ]; then			\
		:;							\
	elif [ "`$(ECHO) $(PATCHDIR)-$(SYSTYPE)/patch-*`" = "$(PATCHDIR)-$(SYSTYPE)/patch-*" ];then \
		$(ECHO_MSG) "Ignoreing empty patch dir";		\
	else								\
		patchfiles=`$(ECHO_MSG) $$patchfiles $(PATCHDIR)-$(SYSTYPE)/patch-*`; \
	fi;								\
	if [ X"$$patchfiles" != "X" ]; then				\
		$(ECHO_MSG) "=> Applying patches for $(DISTNAME)-$(VERSION)";	\
		fail="";						\
		for i in $$patchfiles; do				\
			case $$i in					\
			*.orig|*.rej|*~)				\
				$(ECHO_MSG) "Ignoreing patch $$i" ;;	\
			$(PATCHDIR)/patch-local-*)			\
				;;					\
			*)						\
				$(ECHO_MSG) "add md5 checksum here";	\
				;;					\
			esac;						\
		  fuzz="";						\
		  $(PATCH) -v > /dev/null 2>&1 && fuzz=$(PATCH_FUZZ_FACTOR); \
		  $(PATCH) $$fuzz $(PATCH_ARGS) < $$i			\
			|| ($(ECHO_MSG) "Patch $ii failed" ; exit 1;);	\
		  if [ "X$$fail" != "X" ]; then				\
			$(ECHO_MSG) "Patching failed due to modified patch file(s): $$fail"; \
		  fi; 							\
		done ; 							\
	fi

# An embryo to the new do-patc%:
#PATCH_DIRS?=	patches patches-$(SYSTYPE)
#PATCH_FILES?=	$(foreach dir,$(PATCH_DIRS),$(wildcard $(dir)/*)) \
#		$(PATCHFILES:%=$(_DISTDIR)/%)
new-patch:
	echo "=> Applying patches for $(DISTNAME)-$(VERSION)."
	$(foreach file,$(PATCH_FILES), \
	if [ -f $(file) ]; then \
	    echo "   Applying $(file)."; \
	    fuzz=""; \
	    $(PATCH) -v > /dev/null 2>&1 && fuzz=$(PATCH_FUZZ_FACTOR); \
	    $(PATCH) $$fuzz $(PATCH_ARGS) < $$i \
	    || ($(ECHO_MSG) "Patch $ii failed" ; exit 1;); \
	fi; )


#
# do depends
#

do-depends:
	$(QUIET) $(MKDIR) $(WORKDIR)
ifeq ($(MISSING_DEPENDS),)
	$(QUIET): # Ok, all set.
else
	$(QUIET) $(RM) $(MPKG_DEPENDS)
	$(QUIET) $(ECHO_MSG) "=> Missing dependecies or too old versions of"
	$(QUIET) $(ECHO_MSG) "   $(MISSING_DEPENDS)."
	$(QUIET) $(ECHO_MSG) "   make install-depends and try again."
	$(QUIET) exit 1
endif


#
# do install depends
#

do-install-depends:
	$(QUIET) $(MKDIR) $(WORKDIR)
ifeq ($(MISSING_DEPENDS),)
	$(QUIET): # Ok, all set.
else
	$(QUIET) for deppkg in $(MISSING_DEPENDS); do \
		$(ECHO_MSG) "Installing $$deppkg:"; \
		(cd ../../$$deppkg \
		 && $(MAKE) install); \
		if $(TEST) $$? -eq 0; then \
			$(ECHO_MSG) "Installing $$deppkg done."; \
		else	\
			$(ECHO_MSG) "=> Installing $$deppkg failed."; \
			exit 1;	\
		fi; \
	done; \
	$(RM) $(MPKG_DEPENDS)
	$(MAKE) $(MPKG_DEPENDS)
endif

#
# Use autoconf to rebuild configure-script
#
do-autoreconf:
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS) autoconf/2.67$(COMPILER_TAG); \
	cd $(WRKSRC) && autoreconf

#
# Will be used if your package don't have a target do-configure.
#

do-configur%:
	$(QUIET) $(MKDIR) $(WRKSRC)
ifdef USE_IMAKE
ifdef IMAKE_CPP_ARGS
ifdef IMAKE_CONFDIR
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);			\
	cd $(WRKSRC) && $(CONFIGURE_ENV) imake -DUseInstalled $(IMAKE_CPP_ARGS) -I$(IMAKE_CONFDIR) \
	$(QUIET) cd $(WRKSRC) && $(MAKE) IMAKE_DEFINES="$(IMAKE_CPP_ARGS)" Makefiles
else
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);			\
	$(MKDIR) $(WORKDIR)/dummy;					\
	cd $(WRKSRC) && $(CONFIGURE_ENV) XPROJECTROOT=$(PROGRAM_PREFIX) \
	IMAKEINCLUDE="-I$(WORKDIR)/dummy $(IMAKE_CPP_ARGS)" $(XMKMF)
	$(QUIET) cd $(WRKSRC) && $(MAKE) Makefiles
endif
else
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);			\
	cd $(WRKSRC) && $(CONFIGURE_ENV) XPROJECTROOT=$(PROGRAM_PREFIX) $(XMKMF)
	cd $(WRKSRC) && $(MAKE) Makefiles
endif
endif	
ifdef HAS_CONFIGURE
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);			\
	cd $(WRKSRC) && $(CONFIGURE_ENV) $(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS)
ifdef USE_LIBTOOL
	$(QUIET) $(CP) -f $(PREFIX_libtool)/bin/libtool $(WRKSRC)/libtool
endif
endif
	$(QUIET) : # no-op


#
# Will be used if your package don't have a target do-build.
#

do-buil%:
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);			\
	$(ECHO_MSG) "Building for package $(DISTNAME)-$(VERSION)";			\
	cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(ALL_TARGET)


do-tes%:
	$(MODULE_ADD) $(BUILD_DEPENDS);			\
	$(ECHO_MSG) "Testing for package $(DISTNAME)-$(VERSION)";			\
	cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(TEST_TARGET) 2>&1 | tee $(CURDIR)/testlog

#
# Many packages don't use install-info to build a dir file.
#  XXX I don't know if this is the right way to build the dir file.
#  XXX Maybe move this out to all those packages instead.
#

ifdef BOOTSTRAP 
do-install-info:
	echo "bootstrap phase"
else
do-install-info:
	echo "do-install-info";
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	if [ -d "$(PROGRAM_PREFIX)/info" ]; then \
	    if [ ! -f "$(PROGRAM_PREFIX)/info/dir" ]; then \
		cd $(PROGRAM_PREFIX)/info; \
		if [ "`$(ECHO) *.info`" != "*.info" ]; then \
		   for file in *.info; do \
			$(INSTALL_INFO) --dir-file=dir $$file; \
		   done; \
		else \
		   if [ -f "$(DISTNAME)" ]; then \
			$(INSTALL_INFO) --dir-file=dir $(DISTNAME); \
		   fi; \
		fi; \
	    fi; \
	fi;
endif

#
# Do anything post error
#

do-pos%:
	@ /bin/true

#
# Will be used if your package don't have a target do-install.
#

do-instal%:	do-precreate-dirs
	$(QUIET) $(MODULE_ADD) $(BUILD_DEPENDS);			\
	umask 022 && cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(INSTALL_TARGET)

do-precreate-dir%:
	$(QUIET) $(MKDIR) $(PROGRAM_PREFIX)
ifdef	PRECREATE_DIRS
	$(QUIET) for dir in $(PRECREATE_DIRS) ; do \
	$(QUIET) $(ECHO_MSG) "$(MKDIR) $(PROGRAM_PREFIX)/$$dir"; \
	$(MKDIR) $(PROGRAM_PREFIX)/$$dir ; done
endif


#
# Do any post commands
# 

install-pos%:
	@ /bin/true


#
# Build a modules file.
#

MODULEFILE_CMD_PATH?= \
	if $(TEST) -d $(PROGRAM_PREFIX)/bin; then \
		$(ECHO) "prepend-path PATH $(PROGRAM_PREFIX)/bin"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/sbin; then \
		$(ECHO) "prepend-path PATH $(PROGRAM_PREFIX)/sbin"; \
	fi;
MODULEFILE_CMD_PKGCONFIGPATH?= \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib/pkgconfig; then \
		$(ECHO) "prepend-path PKG_CONFIG_PATH $(PROGRAM_PREFIX)/lib/pkgconfig"; \
	fi;
MODULEFILE_CMD_INCLUDEPATH?= \
	if $(TEST) -d $(PROGRAM_PREFIX)/include; then \
		$(ECHO) "prepend-path INCLUDE_PATH $(PROGRAM_PREFIX)/include"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/include; then \
		$(ECHO) "prepend-path CPLUS_INCLUDE_PATH $(PROGRAM_PREFIX)/include"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/include; then \
		$(ECHO) "prepend-path C_INCLUDE_PATH $(PROGRAM_PREFIX)/include"; \
	fi;
MODULEFILE_CMD_LIBPATH?= \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib; then \
		$(ECHO) "prepend-path LD_LIBRARY_PATH $(PROGRAM_PREFIX)/lib"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib64; then \
		$(ECHO) "prepend-path LD_LIBRARY_PATH $(PROGRAM_PREFIX)/lib64"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib; then \
		$(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/lib"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib; then \
		$(ECHO) "prepend-path LIBRARY_PATH $(PROGRAM_PREFIX)/lib"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib64; then \
		$(ECHO) "prepend-path LIBRARY_PATH $(PROGRAM_PREFIX)/lib64"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib; then \
		$(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/lib"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/lib64; then \
		$(ECHO) "prepend-path LD_RUN_PATH $(PROGRAM_PREFIX)/lib64"; \
	fi;
MODULEFILE_CMD_MANPATH?= \
	if $(TEST) -d $(PROGRAM_PREFIX)/man; then \
		$(ECHO) "prepend-path MANPATH $(PROGRAM_PREFIX)/man"; \
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/share/man; then \
		$(ECHO) "prepend-path MANPATH $(PROGRAM_PREFIX)/share/man"; \
	fi;
MODULEFILE_CMD_INFOPATH?= \
	if $(TEST) -d $(PROGRAM_PREFIX)/info; then \
		$(ECHO) "prepend-path INFOPATH $(PROGRAM_PREFIX)/info";	\
	fi; \
	if $(TEST) -d $(PROGRAM_PREFIX)/share/info; then \
		$(ECHO) "prepend-path INFOPATH $(PROGRAM_PREFIX)/share/info";	\
	fi;
MODULEFILE_CMD_XFILESEARCHPATH?= \
	if $(TEST) -d $(PROGRAM_PREFIX)/app-defaults; then \
		$(ECHO) "prepend-path XUSERFILESEARCHPATH $(PROGRAM_PREFIX)/app-defaults/%N"; \
	elif $(TEST) -d $(PROGRAM_PREFIX)/lib/app-defaults; then \
		$(ECHO) "prepend-path XUSERFILESEARCHPATH $(PROGRAM_PREFIX)/lib/app-defaults/%N"; \
	fi;

MODULEFILE_CMD_PYTHONPATH?= \
	if $(TEST)  -d $(PROGRAM_PREFIX)/lib/python$(VERSION); then \
		$(ECHO) "prepend-path PYTHONPATH $(PROGRAM_PREFIX)/lib/python$(VERSION)"; \
	fi;  \
	if $(TEST)  -d $(PROGRAM_PREFIX)/lib/python; then \
		$(ECHO) "prepend-path PYTHONPATH $(PROGRAM_PREFIX)/lib/python"; \
	fi; 


ifdef RUN_DEPENDS
MODULEFILE_CMD_MODULEDEPS?=	if [ ! -z "$(RUN_DEPENDS)" ]; then	\
				    $(ECHO) "module add $(RUN_DEPENDS)";	\
				fi;
endif

# ifdef DESCRIPTION
# MODULEFILE_CMD_HELP?=	$(strip $(if $(HAS_CONFIGURE),\
# 	$(ECHO) "proc ModulesHelp { } {";					\
# 	for line in "" $(DESCRIPTION); do					\
# 		if [ "X$$line" = "X" ]; then continue; fi;			\
# 		$(ECHO) puts stderr "\"$$line\"";				\
# 	done;									\
# 	$(ECHO) puts stderr "\"\n\"";                                            \
# 	$(ECHO) puts stderr "\"configured with $(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS)\""	\
# 	"}";,                                                          \
# 	$(ECHO) "proc ModulesHelp { } {";					\
# 	for line in "" $(DESCRIPTION); do					\
# 		if [ "X$$line" = "X" ]; then continue; fi;			\
# 		$(ECHO) puts stderr "\"$$line\"";				\
# 	done;									\
# 	"}";))

# endif

ifdef DESCRIPTION
MODULEFILE_CMD_HELP?= $(if \
		$(or \
		   $(strip $(shell /bin/bash -c \
		"if [[ X$(HAS_CONFIGURE) =~ X[yY]es ]]; then echo 1;fi;")),  \
		   $(strip $(shell /bin/bash -c \
		"if [[ X$(GNU_CONFIGURE) =~ X[yY]es ]]; then echo 1;fi;")) \
		), \
		$(ECHO) "proc ModulesHelp { } {";					\
		for line in "" $(DESCRIPTION); do					\
			if [ "X$$line" = "X" ]; then continue; fi;			\
			$(ECHO) puts stderr "\"$$line\"";				\
		done;									\
		$(ECHO) puts stderr "\"\n\"";                                            \
		$(ECHO) puts stderr "{configured with: $(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS)}";	\
		$(ECHO) puts stderr "{build depends: $(BUILD_DEPENDS)}";              	\
		$(ECHO) puts stderr "{run depends: $(RUN_DEPENDS)}";              	\
		$(ECHO) puts stderr "{module depends: $(MODULE_DEPENDS)}";            	\
		$(ECHO) puts stderr "{link depends: $(LINK_DEPENDS)}";            	\
		$(ECHO) "}";,                                                        \
		$(ECHO) "proc ModulesHelp { } {";					\
		for line in "" $(DESCRIPTION); do					\
			if [ "X$$line" = "X" ]; then continue; fi;			\
			$(ECHO) puts stderr "\"$$line\"";				\
		done;                                                                   \
		$(ECHO) puts stderr "{build depends: $(BUILD_DEPENDS)}";              	\
		$(ECHO) puts stderr "{run depends: $(RUN_DEPENDS)}";              	\
		$(ECHO) puts stderr "{module depends: $(MODULE_DEPENDS)}";            	\
		$(ECHO) puts stderr "{link depends: $(LINK_DEPENDS)}";            	\
		$(ECHO) "}";    \
	)
endif

ifdef MENU_CATEGORY
MODULEFILE_CMD_WMMENUPATH?=	\
	$(ECHO) prepend-path WMMENUPATH $(MENUDEFSDIR)/$(DISTNAME)/$(VERSION)
endif

MODULEFILE_CMD_MODULELINES=	for line in $(MODULELINES); do $(ECHO) $$line; done;

ifdef MODULELINES
MODULEFILE_LINES+=	MODULELINES MODULEDEPS HELP WMMENUPATH
else
MODULEFILE_LINES+=	PATH MANPATH INFOPATH XFILESEARCHPATH MODULEDEPS 
MODULEFILE_LINES+=      HELP WMMENUPATH LIBPATH INCLUDEPATH PKGCONFIGPATH PYTHONPATH
endif

MODULEFILE_CMDS+=	$(foreach line,$(MODULEFILE_LINES),$(MODULEFILE_CMD_$(line)))

MODULEFILE_CONFLICTS += $(DISTNAME)

do-modul%:
ifndef DONT_CREATE_METAINFO
	$(QUIET) $(MKDIR) $(MODULEDIR)/$(DISTNAME)
	$(QUIET) (								\
	$(ECHO) "#%Module1.0";							\
	$(ECHO) "module-whatis \"$(DISTNAME) version $(VERSION) (compiled with a $(COMPILERS) compiler)\""; \
	if [ "X$(INSERT_MODULEFILE_CONFLICTS)" == "Xyes" ]; then                \
	 $(ECHO) "conflict $(MODULEFILE_CONFLICTS)";                            \
	fi; \
	$(MODULEFILE_CMDS)							\
	) >$(MODULEDIR)/$(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG)
endif
	@: #no-op, avoid empty target

#
# Support for starting interactive programs from a menu.
#
#  modulename|category|menutext|/path/to/mini-icon|
#  applicationclass|/path/to/icon-for-iconifiation|
#  path/to/program and switches
#

do-menudef%:
ifdef MENU_CATEGORY
	$(QUIET) $(MKDIR) $(MENUDEFSDIR)/$(DISTNAME)/$(VERSION);	\
	file=$(MENUDEFSDIR)/$(DISTNAME)/$(VERSION)/menu.conf;		\
	>$(MENUDEFSDIR)/$(DISTNAME)/$(VERSION)/menu.conf;		\
	$(foreach cmd,$(MENU_COMMANDS),					\
	    $(ECHO) >>$$file "$(DISTNAME)-$(VERSION)|$(MENU_CATEGORY)|$(MENU_COMMAND_MENUTEXT_$(cmd))|$(MINIICON)|$(DISTNAME)|$(NORMALICON)|$(MENU_COMMAND_CMD_$(cmd))"; \
	)
endif
	@: #no-op, avoid empty target


#
# Some simple (right...) help code.
# XXX Need multiple language support. (index-$(LANGUAGE).html)
#

do-information:
ifndef DONT_CREATE_METAINFO
	$(QUIET) \
	test -d $(PROGRAM_PREFIX) || (echo "-1- Program not installed"; exit 1)
	$(QUIET) \
	test -f $(PROGRAM_PREFIX)/.mpkg_depends || (echo "-3- Program not installed"; exit 1)
	$(QUIET) $(MKDIR) $(PREFIX)/information/$(DISTNAME)/$(VERSION)
	$(QUIET) \
	(echo PREFIX_PATH=$(PREFIX_PATH); \
	echo DISTNAME=$(DISTNAME); \
	echo VERSION=$(VERSION); \
	echo DESCRIPTION=$(DESCRIPTION); \
	echo HOMEPAGE=$(HOMEPAGE); \
	echo MAINTAINER=$(MAINTAINER); \
	) > $(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk
ifneq ($(filter STANDARD TERMINAL,$(MENU_COMMANDS)),)
	$(QUIET) if [ -f $(MENU_COMMAND_CMD_STANDARD) -o -f $(PROGRAM_PREFIX)/bin/$(MENU_COMMAND_CMD_STANDARD) ]; then \
		echo COMMANDS=$(MENU_COMMAND_CMD_STANDARD) | sed s,$(PROGRAM_PREFIX)/bin/,, >>$(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk; \
	fi
ifdef INFO_FILE
	$(QUIET) echo INFO_FILE=$(INFO_FILE) >> $(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk
else
	$(QUIET) if [ -f $(PROGRAM_PREFIX)/info/$(DISTNAME).info ] ; then \
	echo INFO_FILE=$(PROGRAM_PREFIX)/info/$(DISTNAME).info \
	>> $(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk; fi
endif
ifneq (,$(wildcard $(PROGRAM_PREFIX)/man))
	$(QUIET) echo MANPATH=$(PROGRAM_PREFIX)/man \
	>> $(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk
endif
endif
ifdef MENU_CATEGORY
	echo MENU_CATEGORY=$(MENU_CATEGORY) >>$(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk
endif
ifdef CATEGORIES
	echo CATEGORIES=$(sort $(CATEGORIES)) >>$(PREFIX)/information/$(DISTNAME)/$(VERSION)/information.mk
endif
endif
	@:

do-html:
	$(QUIET) \
	test -d $(PROGRAM_PREFIX) || (echo "-1- Program not installed"; exit 1)
	$(QUIET) \
	test -f $(PROGRAM_PREFIX)/.mpkg_depends || (echo "-3- Program not installed"; exit 1)
	$(QUIET) $(MKDIR) $(PREFIX)/html/$(DISTNAME)/$(VERSION)
	$(QUIET) ($(PACKAGE_HTML)) > $(PREFIX)/html/$(DISTNAME)/$(VERSION)/index.html

do-markdown:
ifndef DONT_CREATE_METAINFO
	$(QUIET) \
	test -d $(PROGRAM_PREFIX) || (echo "-1- Program not installed"; exit 1)
	$(QUIET) \
	test -f $(PROGRAM_PREFIX)/.mpkg_depends || (echo "-3- Program not installed"; exit 1)
	#$(QUIET) $(MKDIR) $(PREFIX)/markdown/$(DISTNAME)/$(VERSION)
	$(QUIET) $(MKDIR) $(PREFIX)/markdown/$(DISTNAME)
	$(QUIET) ($(PACKAGE_MARKDOWN)) > $(PREFIX)/markdown/$(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG).mdwn
	$(QUIET) \
	test -f $(PREFIX)/markdown/index.mdwn || echo "[[!map pages=\"* and !*/* and !index and !markdown.mk\"]]" > $(PREFIX)/markdown/index.mdwn
endif
	@:

#
# PVP-making
#

do-pvp:
	$(QUIET) $(MKDIR) $(PREFIX)/pvp/$(DISTNAME)/$(VERSION); \
	version_pvp=$(PREFIX)/pvp/$(DISTNAME)/$(VERSION)/mpkg.pvp; \
	pkg_pvp=$(PREFIX)/pvp/$(DISTNAME)/mpkg.pvp; \
	pvp=$(PREFIX)/pvp/$(DISTNAME)/mpkg.pvp; \
	> $$version_pvp ( \
	echo "%ifdef LOCAL_MPKG_$(DISTNAME)_$(VERSION)"; \
	echo "TR /mpkg/$(DISTNAME)/$(VERSION) $${machine}"; \
	echo "else" \
	echo "L /mpkg/$(DISTNAME)/$(VERSION) $${machine}"; \
	echo "%endif"; \
	); \
	> $$pkg_pvp ( \
	echo "%ifdef LOCAL_MPKG_$(DISTNAME)"; \
	$(foreach version,$(VERSIONS), \
	echo "%include $${machine}/mpkg/pvp/$(DISTNAME)/$(version)/mpkg.pvp"; \
	) \
	echo "else" \
	echo "L /mpkg/$(DISTNAME) $${machine}"; \
	echo "%endif"; \
	); \
	> $$pkg_pvp ( \
	echo "%ifdef LOCAL_MPKG"; \
	$(foreach distname,$(DISTNAMES), \
	echo "%include $${machine}/mpkg/pvp/$(distname)/mpkg.pvp"; \
	) \
	echo "else" \
	echo "L /mpkg $${machine}"; \
	echo "%endif"; \
	); \


#
# Check if it will work
#

do-check:
ifneq (,$(foreach substring,$(BROKEN),$(findstring $(substring),$(SYSTEM_TYPE))))
	$(QUIET) $(ECHO_MSG) "Package is broken:" $(BROKEN) on $(SYSTEM_TYPE)
endif
	$(QUIET):

clean: do-clean

do-clea%:
	$(QUIET) $(RM_RF) $(WORKDIR)
	$(QUIET) $(RM) *~
	$(QUIET) if [ -e testlog ]; then $(RM) testlog; fi

remove-distribution-files:
	$(QUIET) $(MAKE) clean
	$(QUIET) cd $(DISTDIR);						\
	for file in "" $(_DISTFILES) $(_PATCHFILES); do			\
		$(RM) $$file;						\
	done
