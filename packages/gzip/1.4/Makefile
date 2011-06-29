include ../../../mk/gnu.pre.mk

DISTNAME=	gzip
VERSION=	1.4
CATEGORIES=	archive
HOMEPAGE=	http://www.gnu.org/software/gzip/gzip.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	CC="cc -std1 -w1 -fast"
endif

DESCRIPTION=	"Gzip (GNU zip) is a popular data compression program written"
DESCRIPTION+=	"for the GNU project. We developed this program as a"
DESCRIPTION+=	"replacement for 'compress' because of the UNISYS and IBM"
DESCRIPTION+=	"patents covering the LZW algorithm used by compress."
DESCRIPTION+=	"These patents made it impossible for us to use compress,"
DESCRIPTION+=	"and we needed a replacement. The superior compression ratio"
DESCRIPTION+=	"and speed of GZIP is just a bonus."

include ../../../mk/gnu.post.mk
