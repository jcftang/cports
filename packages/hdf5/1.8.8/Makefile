include ../../../mk/gnu.pre.mk

DISTNAME=	hdf5
VERSION=	1.8.8
CATEGORIES=	lib
HOMEPAGE=	http://www.hdfgroup.org/HDF5
MASTER_SITES=	http://www.hdfgroup.org/ftp/HDF5/releases/$(DISTNAME)-$(VERSION)/src
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES=	$(DISTNAME)-$(VERSION).tar.gz

DEPENDS+=	"zlib/1.2.5 --lib --build-env"
DEPENDS+=	"szip/2.1 --lib --build-env"

CONFIGURE_ARGS= --with-default-api-version=v16 --with-szlib=$(PREFIX_szlib) --with-zlib=$(PREFIX_ZLIB) --enable-fortran  --enable-cxx

DESCRIPTION=    "HDF5 is a data model, library, and file format for storing and managing"
DESCRIPTION+=    "data. It supports an unlimited variety of datatypes, and is designed for"
DESCRIPTION+=    "flexible and efficient I/O and for high volume and complex data. HDF5 is"
DESCRIPTION+=    "portable and is extensible, allowing applications to evolve in their use"
DESCRIPTION+=    "of HDF5. The HDF5 Technology suite includes tools and applications for"
DESCRIPTION+=    "managing, manipulating, viewing, and analyzing data in the HDF5 format."

include ../../../mk/gnu.post.mk
