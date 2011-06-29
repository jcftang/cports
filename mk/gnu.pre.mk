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
# $Id: gnu.pre.mk,v 1.15 2002/03/04 17:00:45 abo Exp $
#

ifndef GNU_MPKG_PRE_MK
GNU_MPKG_PRE_MK = 1


# Help message
HELP_MSG += "Available targets are:\n"
HELP_MSG += " > make fetch\n"
HELP_MSG += "     Fetch all distribution files this program.\n"
HELP_MSG += " > make build\n"
HELP_MSG += "     Build this program. Do not install.\n"
HELP_MSG += " > make install\n"
HELP_MSG += "     Install program including all prerequisites.\n"
HELP_MSG += " > make clean\n"
HELP_MSG += "     Clean up, remove the build tree.\n"


MPKGDIR=	$(shell while [ ! -f mk/gnu.pre.mk ]; do cd ..; done; pwd)
-include $(MPKGDIR)/mk/gnu.local.mk
MPKGCONF?=	$(MPKGDIR)/mk-conf
#SUBDIR=		$(shell pwd | sed s,$(MPKGDIR)/,,)
-include $(MPKGCONF)/config.mk


#
# GNU autoconf config.guess style system type.
#  Examples:
#   i686-pc-linux-gnu, split into: i686 pc linux-gnu
#   sparc-sun-solaris2.7
#   alphaev56-dec-osf4.0d
#

ifndef SYSTEM_TYPE
SYSTEM_TYPE=	$(shell (cd /tmp && $(MPKGDIR)/scripts/config.guess))
MAKE+= SYSTEM_TYPE=$(SYSTEM_TYPE)
endif
ifndef SYSTEM_TYPE_CPU
SYSTEM_TYPE_CPU=	$(shell echo $(SYSTEM_TYPE) | \
			        sed "s,-.*,,")
MAKE+= SYSTEM_TYPE_CPU=$(SYSTEM_TYPE_CPU)
endif
ifndef SYSTEM_TYPE_VENDOR
SYSTEM_TYPE_VENDOR=	$(shell echo $(SYSTEM_TYPE) | \
			        sed "s,^[^-]*-\([^-]*\)-.*,\\1,")
MAKE+= SYSTEM_TYPE_VENDOR=$(SYSTEM_TYPE_VENDOR) 
endif
ifndef SYSTEM_TYPE_OS
SYSTEM_TYPE_OS=		$(shell echo $(SYSTEM_TYPE) | \
			        sed "s,^[^-]*-[^-]*-\(.*\)$$,\\1,")
MAKE+= SYSTEM_TYPE_OS=$(SYSTEM_TYPE_OS)
endif

ifndef DISTRO_TYPE
DISTRO_TYPE=            $(shell $(MPKGDIR)/scripts/distro.guess)
endif


#
# AFS sysname
#  This is obsolete. Use SYSTEM_TYPE or SYSTEM_TYPE_* instead.
#

ifneq (,$(findstring alphaev,$(SYSTEM_TYPE_CPU)))
ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
GUESS_SYSTYPE_CPU?=	alpha
GUESS_SYSTYPE_OS?=	dux40d
endif
endif

ifneq (,$(findstring i686,$(SYSTEM_TYPE_CPU)))
GUESS_SYSTYPE_CPU?=	i386
endif
ifneq (,$(findstring i586,$(SYSTEM_TYPE_CPU)))
GUESS_SYSTYPE_CPU?=	i386
endif
ifneq (,$(findstring i486,$(SYSTEM_TYPE_CPU)))
GUESS_SYSTYPE_CPU?=	i386
endif
ifneq (,$(findstring i386,$(SYSTEM_TYPE_CPU)))
GUESS_SYSTYPE_CPU?=	i386
endif
ifneq (,$(findstring sparc,$(SYSTEM_TYPE_CPU)))
GUESS_SYSTYPE_CPU?=	sun4x
endif

ifneq (,$(findstring linux,$(SYSTEM_TYPE_OS)))
GUESS_SYSTYPE_OS?=	linux6
endif
ifneq (,$(findstring freebsd,$(SYSTEM_TYPE_OS)))
GUESS_SYSTYPE_OS?=	fbsd
endif
ifneq (,$(findstring solaris2.8,$(SYSTEM_TYPE_OS)))
GUESS_SYSTYPE_OS?=	58
endif

SYSTYPE?=	$(shell (foo/fs sysname 2>/dev/null || echo "'$(GUESS_SYSTYPE_CPU)_$(GUESS_SYSTYPE_OS)") |awk "-F'" '{print $$2}')


#
# Tests to perform
#  Instead of doing different things depending on the value of SYSTEM_TYPE,
#  we should if possible test to see what works. That is more portable.
#

# Where to find X11.
#  XXX doesn't work?
X11BASE?=	$(shell for x11base in /usr/X11R6 /lib/X11; do if [ -d $$x11base ]; then found=$$x11base; fi; done; echo $$found)

#  colon-separated, multiple-arguments, both
TEST_RPATH_STYLE?=	$(shell echo XXX-not-implemented-yet)
#  "-Wl,-rpath", "-R"
TEST_RPATH_PARAM?=	$(shell echo XXX-not-implemented-yet)

TEST_GCC_IS_EGCS?=	$(shell type -t gcc && gcc --version | grep egcs >/dev/null && echo yes)


#
# Default target
#

all: help

endif
