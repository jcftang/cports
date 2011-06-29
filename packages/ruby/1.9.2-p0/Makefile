include ../../../mk/gnu.pre.mk

DISTNAME=	ruby
VERSION=	1.9.2-p0
CATEGORIES=	scripting
HOMEPAGE=	http://www.ruby-lang.org
MASTER_SITES=	ftp://ftp.ruby-lang.org//pub/ruby/1.9
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DESCRIPTION=	"Ruby is a dynamic, open source programming language"
DESCRIPTION+=   "with a focus on simplicity and productivity. It has an elegant syntax"
DESCRIPTION+=   "that is natural to read and easy to write."

do-build:
	cd $(WRKSRC) && $(MAKE)
	$(QUIET) touch $(BUILD_COOKIE)

do-install: do-install-info do-post
	cd $(WRKSRC) && $(MAKE) install 

include ../../../mk/gnu.post.mk
