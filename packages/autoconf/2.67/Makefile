include ../../../mk/gnu.pre.mk

DISTNAME=       autoconf
VERSION=        2.67
CATEGORIES=     devel
HOMEPAGE=       http://www.gnu.org/software/autoconf/autoconf.html
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

DEPENDS+=       "m4/1.4.15 --build-env"
DEPENDS+=       "gawk/3.1.8 --build-env"
#DEPENDS+=       "perl/5.12.1 --build-env"

CONFIGURE_ENV+= M4=$(PREFIX_m4)/bin/m4
CONFIGURE_ENV+= AWK=$(PREFIX_gawk)/bin/gawk
#INFO_FILE=     autoconf.info standards.info

DESCRIPTION=    "Autoconf is an extensible package of m4 macros that produce"
DESCRIPTION+=   "shell scripts to automatically configure software source"
DESCRIPTION+=   "code packages. These scripts can adapt the packages to many"
DESCRIPTION+=   "kinds of UNIX-like systems without manual user intervention."
DESCRIPTION+=   "Autoconf creates a configuration script for a package from a"
DESCRIPTION+=   "template file that lists the operating system features that"
DESCRIPTION+=   "the package can use, in the form of m4 macro calls."

include ../../../mk/gnu.post.mk

