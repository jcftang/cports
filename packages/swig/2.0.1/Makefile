include ../../../mk/gnu.pre.mk

DISTNAME=	swig
VERSION=	2.0.1
CATEGORIES=	development
HOMEPAGE=	http://www.swig.org/
MASTER_SITES=	http://sourceforge.net/projects/swig/files/swig/swig-$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=	"pcre/8.10 --lib --build-env"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"

ALL_TARGET=	swig

DESCRIPTION=    "SWIG is a software development tool that reads C/C++ header files and"
DESCRIPTION=    "generates wrapper code to make C/C++ code accessible from other languages"
DESCRIPTION=    "including Perl, Python, Tcl, Ruby, PHP, Java, Ocaml, Lua, C#, Modula-3,"
DESCRIPTION=    "R, Octave and Scheme & Lisp variants."

include ../../../mk/gnu.post.mk
