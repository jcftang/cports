include ../../../mk/gnu.pre.mk

DISTNAME=       annotations
VERSION=        1.0.4.2
CATEGORIES=     utilities
HOMEPAGE=       http://www.pell.portland.or.us/~orc/Code/annotations/
MASTER_SITES=   http://www.pell.portland.or.us/~orc/Code/annotations/
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.gz
HAS_CONFIGURE=  yes


DEPENDS+=	"discount/2.0.1 --build-env --run-env"
WEBUSER=	www-data

DESCRIPTION=	"Annotations, combined with a webserver that supports basic auth and cgi"
DESCRIPTION+=	"scripts, builds and maintains weblogs. It maintains the weblog as static"
DESCRIPTION+=	"pages, keeps articles in folders that tell you the date the article was"
DESCRIPTION+=	"posted (YYYY/MM/DD/seq), and produces RSS 2.0 and Atom 1.0 syndication"
DESCRIPTION+=	"formats."

CONFIGURE_SCRIPT=	./configure.sh
CONFIGURE_ARGS=		--prefix=$(PROGRAM_PREFIX) --userdir=public_html --webuser $(WEBUSER)

LIBOBJS="articles.o format.o indexer.o initialize.o mapfile.o post.o readconfig.o rewrite.o rss.o theme.o xgetenv.o version.o uncgi.o"

do-configure: 
	$(MKDIR) $(PROGRAM_PREFIX)/htdocs/cgi-bin
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	$(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS)

do-build: 
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	$(MAKE) uncgi.o; \
	$(MAKE) LIBOBJS=$(LIBOBJS) libannot.a; \
	$(MAKE) 

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/{bin,lib,include}
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	$(MAKE) install

include ../../../mk/gnu.post.mk
