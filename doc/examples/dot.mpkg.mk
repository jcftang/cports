#
# Various paths
#

DISTDIR?=               $(HOME)/sources
PREFIX?=                $(HOME)/cports/$(DISTRO_TYPE)
LOCAL_DIST_SITE?=
MODULEDIR?=             $(PREFIX)/modulefiles
MENUDEFSDIR?=           $(PREFIX)/menudefs
BASE_ICONPATH?=         /misc/graphics/icons
INFODIR?=               $(PREFIX)/information
#FETCH?=			aria2c --check-certificate=false
INSTALL_INFO?=		/sbin/install-info

## DISTDIR?=               $(HOME)/sources
## PREFIX?=                $(HOME)/cports.t/usr/cports/$(DISTRO_TYPE)
## LOCAL_DIST_SITE?=
## MODULEDIR?=             $(HOME)/cports.t/usr/cports/modulefiles/$(DISTRO_TYPE)
## MENUDEFSDIR?=           $(PREFIX)/menudefs
## BASE_ICONPATH?=         /misc/graphics/icons
## INFODIR?=               $(PREFIX)/information
## FETCH?=			aria2c --check-certificate=false

