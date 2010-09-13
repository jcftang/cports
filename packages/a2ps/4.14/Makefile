include ../../../mk/gnu.pre.mk

DISTNAME=	a2ps
VERSION=	4.14
CATEGORIES=	printing
HOMEPAGE=	http://www.gnu.org/software/a2ps/a2ps.html
MASTER_SITES=	http://ftp.gnu.org/gnu/a2ps/
MASTER_SITES+=	ftp://ftp.enst.fr/pub/unix/a2ps/
MASTER_SITES+=	http://www.inf.enst.fr/~demaille/a2ps/sheets
PKGSUBDIR=	$(DISTNAME)-4.14
DISTFILES=	$(DISTNAME)-$(VERSION)$(EXTRACT_SUFX)
DISTFILES+=	sheets.tar.gz
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

EXTRACT_ONLY=	$(DISTNAME)-$(VERSION)$(EXTRACT_SUFX)

DEPENDS=	"psutils/p17 --build-env"
DEPENDS+=	"groff/1.20 --build-env"
DEPENDS+=	"file/5.04 --build-env"
DEPENDS+=	"gettext/0.18.1.1 --lib --build-env"
DEPENDS+=	"ghostscript/8.71 --build-env"
DEPENDS+=	"texinfo/4.13 --build-env"
DEPENDS+=	"m4/1.4.14 --build-env"
DEPENDS+=	"gzip/1.4 --build-env"
DEPENDS+=	"flex/2.5.35 --lib --build-env"
DEPENDS+=	"gperf/3.0.4 --build-env"
DEPENDS+=	"libtool/2.2.10 --build-env"
DEPENDS+=	"libiconv/1.13 --lib --build-env"

CONFIGURE_ARGS=	--enable-shared=yes --enable-paths
CONFIGURE_ARGS+=--with-medium=A4 --with-encoding=latin1

CONFIGURE_ENV+= LPR=lpr

DESCRIPTION=	"a2ps is an Any to PostScript filter. It started as a Text to"
DESCRIPTION+=	"PostScript converter, with pretty printing features and all"
DESCRIPTION+=	"the expected features from this kind of programs. But today,"
DESCRIPTION+=	"it is also able to deal with other file types (PostScript,"
DESCRIPTION+=	"Texinfo, compressed, whatever...) provided you have the"
DESCRIPTION+=	"necessary tools."

include ../../../mk/gnu.post.mk
