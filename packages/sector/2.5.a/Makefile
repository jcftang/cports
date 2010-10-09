include ../../../mk/gnu.pre.mk

DISTNAME=	sector
VERSION=	2.5.a
EXTRAVERSION=	
CATEGORIES=	clustering
HOMEPAGE=	http://sector.sourceforge.net/
MASTER_SITES=	http://downloads.sourceforge.net/project/sector/SECTOR/2.5
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME).$(VERSION).tar.gz

DESCRIPTION=	"SECTOR: A Distributed Data Storage and Processing Platform"
PKGSUBDIR=	$(DISTNAME)-sphere

DEPENDS+=	"openssl/1.0.0a --build-env --lib"
DEPENDS+=	"zlib/1.2.5 --build-env --lib"

ALL_TARGET=	subdirs

MODULEFILE_LINES+=      SECTOR_HOME
MODULEFILE_CMD_SECTOR_HOME?= \
        $(ECHO) "setenv  SECTOR_HOME $(PROGRAM_PREFIX)";

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)
	cd $(WRKSRC); \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - )
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	-$(LN) $(PROGRAM_PREFIX)/tools/sector_* $(PROGRAM_PREFIX)/bin/
	-$(LN) $(PROGRAM_PREFIX)/master/start_all $(PROGRAM_PREFIX)/bin/
	-$(LN) $(PROGRAM_PREFIX)/master/stop_all $(PROGRAM_PREFIX)/bin/
	-$(LN) $(PROGRAM_PREFIX)/master/start_master $(PROGRAM_PREFIX)/bin/
	-$(LN) $(PROGRAM_PREFIX)/slave/start_slave $(PROGRAM_PREFIX)/bin/
	-$(LN) $(PROGRAM_PREFIX)/security/sserver $(PROGRAM_PREFIX)/bin/
	-$(LN) $(PROGRAM_PREFIX)/security/ssl_cert_gen $(PROGRAM_PREFIX)/bin/

include ../../../mk/gnu.post.mk
