include ../../../mk/gnu.pre.mk

DISTNAME=	jdk
VERSION=	1.6.0_26
CATEGORIES=	devel
HOMEPAGE=	http://java.sun.com/javase/downloads/index.jsp
MAINTAINER=	jtang@tchpc.tcd.ie

JBASE=$(DISTNAME)-6u26-linux

ifeq ("$(SYSTEM_TYPE)", "i686-redhat-linux-gnu")
# Can't download, but it in distfiles dir manually. And don't export it
# to the world. Lawyers!
MASTER_SITES=	
DISTFILES=	$(JBASE)-i586.bin
HAVE_SOFTWARE=	true
PKGNAME=	jdk$(VERSION)
else
DISTFILES=
endif
ifeq ("$(SYSTEM_TYPE)", "x86_64-redhat-linux-gnu")
# Can't download, but it in distfiles dir manually. And don't export it
# to the world. Lawyers!
MASTER_SITES=	
DISTFILES=	$(JBASE)-x64.bin
HAVE_SOFTWARE=	true
PKGNAME=	jdk$(VERSION)
else
DISTFILES=
endif


MODULELINES=	"prepend-path	PATH	$(PROGRAM_PREFIX)/bin" \
		"prepend-path	CLASSPATH	$(PROGRAM_PREFIX)/jre/lib/rt.jar" \
		"prepend-path	CLASSPATH	$(PROGRAM_PREFIX)/lib/dt.jar" \
		"prepend-path	CLASSPATH	."

NORMALICON=	java.xpm

DESCRIPTION=	"The Java Developer Kit (JDK) software is the premier solution"
DESCRIPTION+=	"for rapidly developing and deploying mission-critical,"
DESCRIPTION+=	"enterprise applications. Version 1.4 builds upon Java"
DESCRIPTION+=	"technology's cross-platform support and robust security model"
DESCRIPTION+=	"with new features and functionality, enhanced performance and"
DESCRIPTION+=	"scalability, and improved reliability and serviceability."

do-build:
ifdef HAVE_SOFTWARE
ifeq ("$(SYSTEM_TYPE)", "i686-redhat-linux-gnu")
	MORE=10000 cd $(WORKDIR); \
	(echo yes; echo yes; echo yes; echo yes; echo yes) | /bin/sh $(JBASE)-i586.bin
endif
ifeq ("$(SYSTEM_TYPE)", "x86_64-redhat-linux-gnu")
	MORE=10000 cd $(WORKDIR); \
	(echo yes; echo yes; echo yes; echo yes; echo yes) | /bin/sh $(JBASE)-x64.bin
endif
endif
	@: #no-op

do-install:	do-precreate-dirs
ifdef HAVE_SOFTWARE
ifeq ("$(SYSTEM_TYPE)", "i686-pc-linux-gnu")
	cd $(WRKSRC); \
	$(TAR) cf - * | (cd $(PROGRAM_PREFIX) && $(TAR) xf -)
endif
ifeq ("$(SYSTEM_TYPE)", "x86_64-redhat-linux-gnu")
	cd $(WRKSRC); \
	$(TAR) cf - * | (cd $(PROGRAM_PREFIX) && $(TAR) xf -)
endif
endif
	@: #no-op

include ../../../mk/gnu.post.mk
