
include ../../../mk/gnu.pre.mk

DISTNAME=	ispell
VERSION=	3.1
CATEGORIES=
MASTER_SITES=	ftp://ftp.cs.ucla.edu/pub/ispell-3.1/
DISTFILES=	ispell-3.1.20.tar.gz

MAINTAINER=	packages@s3.kth.se
HOMEPAGE=	http://fmg-www.cs.ucla.edu/geoff/ispell.html
#HOMEPAGE=	http://www.gnu.org/software/ispell/ispell.html

#TODO: Svenska ordlistor http://fmg-www.cs.ucla.edu/geoff/ispell-dictionaries.html#Swedish-dicts

DESCRIPTION=	"Ispell is a program that helps you to correct spelling and"
DESCRIPTION+=	"typographical errors in a file. When presented with a word"
DESCRIPTION+=	"that is not in the dictionary, ispell attempts to find near"
DESCRIPTION+=	"misses that might include the word you meant."

do-configure:
	cd $(WRKSRC);							\
	cp local.h.samp local.h.bak;					\
	sed "s;/usr/local;$(PROGRAM_PREFIX);" <local.h.bak >local.h

include ../../../mk/gnu.post.mk
