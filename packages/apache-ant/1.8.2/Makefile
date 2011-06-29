include ../../../mk/gnu.pre.mk

DISTNAME=	apache-ant
VERSION=	1.8.2
EXTRAVERSION=	
CATEGORIES=	devel
HOMEPAGE=	http://ant.apache.org/
MASTER_SITES=	http://ftp.heanet.ie/mirrors/www.apache.org/dist//ant/binaries
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION)-bin.tar.bz2

DESCRIPTION=	"Apache Ant is a Java library and command-line tool that help building software."

DEPENDS+=	"jdk/1.6.0_21 --run-env"

do-build:
	#no-op don't need to build this
	@:

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	cd $(WORKDIR); \
	rsync -a  $(PKGSUBDIR)/. $(PROGRAM_PREFIX)/. 
	#install -m755 $(DISTNAME)-$(VERSION).bin  $(PROGRAM_PREFIX)/bin/darcs ;

include ../../../mk/gnu.post.mk
