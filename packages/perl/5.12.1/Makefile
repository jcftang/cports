# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	perl
VERSION=	5.12.1
CATEGORIES=	Development
HOMEPAGE=	http://www.cpan.org/
MASTER_SITES=	http://www.cpan.org/src/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION=

CONFIGURE_ARGS=		--prefix=$(PROGRAM_PREFIX) 
CONFIGURE_SCRIPT= 	./configure.gnu


DESCRIPTION=    "Perl is a high-level programming language with an eclectic"
DESCRIPTION+=   "heritage. It derives from the ubiquitous C programming"
DESCRIPTION+=   "language and to a lesser extent from sed, awk, the Unix"
DESCRIPTION+=   "shell, and at least a dozen other tools and languages."
DESCRIPTION+=   "Perl's process, file, and text manipulation facilities make"
DESCRIPTION+=   "it particularly well-suited for tasks involving quick"
DESCRIPTION+=   "prototyping, system utilities, software tools, system"
DESCRIPTION+=   "management tasks, database access, graphical programming,"
DESCRIPTION+=   "networking, and world wide web programming."

#
# should also include the following system devel libraries (or in the ports)
# 
# mysql-devel (don't need this, its optional)
# postgresql-devel (don't need this, its optional)
# sqlite (don't need this, its optional)
# expat
# graphviz

PERL_MODULES+= AcePerl DBD-Pg libxml-enno Set-Scalar SVG-Graph XML-SAX	\
	Algorithm-Munkres Clone DBD-SQLite HTML-Parser libxml-perl	\
	SOAP-Lite URI XML-SAX-Writer Array-Compare Convert-Binary-C	\
	DBI IO-String List-MoreUtils Spreadsheet-ParseExcel		\
	XML-DOM-XPath XML-Simple Bio-ASN1-EntrezGene Data-Stag Graph	\
	IO-stringy Math-Random Spreadsheet-WriteExcel			\
	XML-NamespaceSupport XML-Twig BioPerl DBD-mysql GraphViz	\
	libwww-perl PostScript SVG XML-Parser XML-Writer Statistics-Descriptive

include ../../../mk/prg.perl.mk
include ../../../mk/gnu.post.mk
