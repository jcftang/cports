include ../../../mk/gnu.pre.mk

DISTNAME=       asciidoc
VERSION=        8.6.1
CATEGORIES=     devel
HOMEPAGE=       http://www.methods.co.nz/asciidoc
MASTER_SITES=   http://downloads.sourceforge.net/project/asciidoc/asciidoc/$(VERSION)
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.gz
GNU_CONFIGURE=  yes

DEPENDS+= "Python/2.6.5 --lib --build-env --run-env"

DESCRIPTION=    "Text based document generation"

MODULEFILE_LINES+=	PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
	$(ECHO)	"prepend-path	PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";

include ../../../mk/gnu.post.mk

