include ../../../mk/gnu.pre.mk

DISTNAME=	gperf
VERSION=	3.0.4
CATEGORIES=	devel science
HOMEPAGE=	http://www.gnu.org/software/gperf/gperf.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	CC="cc -std1 -w1"
CONFIGURE_ENV+=	CXX="cxx -std1 -w1 -nocompress"
endif

DESCRIPTION=	"GNU gperf is a perfect hash function generator. For a given"
DESCRIPTION+=	"list of strings, it produces a hash function and hash table,"
DESCRIPTION+=	"in form of C or C++ code, for looking up a value depending"
DESCRIPTION+=	"on the input string. The hash function is perfect, which"
DESCRIPTION+=	"means that the hash table has no collisions, and the hash"
DESCRIPTION+=	"table lookup needs a single string comparison only."

include ../../../mk/gnu.post.mk
