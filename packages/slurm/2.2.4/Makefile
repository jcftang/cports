include ../../../mk/gnu.pre.mk

DISTNAME=	slurm
VERSION=	2.2.4
CATEGORIES=	system
HOMEPAGE=	https://computing.llnl.gov/linux/slurm/
MASTER_SITES=	http://downloads.sourceforge.net/project/slurm/slurm/version_2.2/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2
GNU_CONFIGURE=	yes

# most of these are optional and the user can disable/enable as required
DEPENDS+=	"readline/6.1 --lib --build-env"
DEPENDS+=	"openssl/1.0.0a --lib --build-env"
DEPENDS+=	"Python/2.6.5 --lib --build-env"

CONFIGURE_ARGS+= --with-ssl=$(PREFIX_openssl)

DESCRIPTION=   "SLURM is a resource manager for executing parallel jobs on clusters"
DESCRIPTION+=   "of any size. Simple configurations can be established in a couple"
DESCRIPTION+=   "of minutes. More complex batch scheduling configurations satisfy"
DESCRIPTION+=   "the needs at some HPC sites."

include ../../../mk/gnu.post.mk
