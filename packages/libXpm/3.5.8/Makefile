# $Id: Makefile,v 1.9 2002/02/27 17:18:40 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	libXpm
VERSION=	3.5.8
CATEGORIES=	graphics lib
HOMEPAGE=	http://xorg.freedesktop.org/wiki/ModuleComponentList
MASTER_SITES=	ftp://ftp.x.org/pub/individual/lib
MASTER_SITES+=	ftp://ftp.mirrorservice.org/sites/ftp.x.org/pub/individual/lib
MASTER_SITES+=	$(MASTER_SITE_X11_CONTRIB:=libraries/)
MAINTAINER=	mpkg@e.kth.se
GNU_CONFIGURE=	yes

DESCRIPTION=	"XPixMap (XPM) consists of an ASCII image format and a"
DESCRIPTION+=	"C library. The format defines how to store color images"
DESCRIPTION+=	"(X Pixmap) in a portable and powerful way. The library"
DESCRIPTION+=	"provides a set of functions to store and retrieve images"
DESCRIPTION+=	"to and from XPM format data, being either files, buffers"
DESCRIPTION+=	"(files in memory), or data (included files)."

#do-configure:	do-configur%
#	$(MKDIR) $(WRKSRC)/X11/X11 ; cp $(WRKSRC)/lib/xpm.h $(WRKSRC)/X11/X11

include ../../../mk/gnu.post.mk
