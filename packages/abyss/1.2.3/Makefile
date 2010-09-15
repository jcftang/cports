include ../../../mk/gnu.pre.mk

DISTNAME=	abyss
VERSION=	1.2.3
HOMEPAGE=	http://www.bcgsc.ca/platform/bioinfo/software/abyss
MASTER_SITES=	http://www.bcgsc.ca/downloads/abyss/
MAINTAINER=	neil@tchpc.tcd.ie
GNU_CONFIGURE=	yes

DEPENDS=	"openmpi/1.4.2	--lib --build-env --run-env"
DEPENDS+=	"sparsehash/1.8.1 --lib --build-env --run-env"

DESCRIPTION=	"Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"

CONFIGURE_ARGS+= ""

AM_CXXFLAGS = "-Wall -Wextra"

include ../../../mk/gnu.post.mk
