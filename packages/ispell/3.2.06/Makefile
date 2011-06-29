
include ../../../mk/gnu.pre.mk

DISTNAME=	ispell
VERSION=	3.2.06
CATEGORIES=
MASTER_SITES=	http://lever.cs.ucla.edu/geoff/tars/

MAINTAINER=	mpkg@e.kth.se
HOMEPAGE=	http://fmg-www.cs.ucla.edu/geoff/ispell.html
#HOMEPAGE=	http://www.gnu.org/software/ispell/ispell.html

#TODO: Svenska ordlistor http://fmg-www.cs.ucla.edu/geoff/ispell-dictionaries.html#Swedish-dicts

DESCRIPTION=	"Ispell is a program that helps you to correct spelling and"
DESCRIPTION+=	"typographical errors in a file. When presented with a word"
DESCRIPTION+=	"that is not in the dictionary, ispell attempts to find near"
DESCRIPTION+=	"misses that might include the word you meant."

PRECREATE_DIRS= bin lib man

do-configure:
	cd $(WRKSRC);							\
	cp local.h.samp local.h.bak;					\
	cat local.h.bak | sed -e "s,/usr/local,$(PROGRAM_PREFIX)," | sed -e "s/undef USG/define USG/" > local.h;\
	echo '#define CC "gcc"' >> local.h

include ../../../mk/gnu.post.mk
