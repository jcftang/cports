include ../../../mk/gnu.pre.mk

DISTNAME=	keepassx
VERSION=	0.4.3
CATEGORIES=	graphics
HOMEPAGE=	http://www.keepassx.org/
MASTER_SITES=	http://downloads.sourceforge.net/keepassx/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no

EXTRAVERSION=

DESCRIPTION=	"KeePassX is an application for people with extremly high demands on secure personal data management. It has a light interface, is cross platform and published under the terms of the GNU General Public License."

DEPENDS+=       "qt/4.7.0 --lib --build-env --run-env"
DEPENDS+=       "gettext/0.18.1.1 --lib --build-env --run-env"
DEPENDS+=       "fontconfig/2.8.0 --lib --build-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	qmake PREFIX=$(PROGRAM_PREFIX); \
	make

include ../../../mk/gnu.post.mk
