include ../../../mk/gnu.pre.mk

DISTNAME=	automake
VERSION=	1.11
LIBTOOLVERSION=	2.2.10
CATEGORIES=	devel
HOMEPAGE=	http://www.gnu.org/software/automake/automake.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=	jtang@tchpc.tcd.ie
USE_PERL5=	yes
GNU_CONFIGURE=	yes

DEPENDS=	"m4/1.4.14 --build-env" 
DEPENDS+=	"autoconf/2.67 --build-env --run-env"
#DEPENDS+=	"perl/5.12.1 --build-env"

DESCRIPTION=	"Automake is a tool for automatically generating 'Makefile.in'"
DESCRIPTION+=	"files compliant with the GNU Coding Standards."

include ../../../mk/gnu.post.mk

