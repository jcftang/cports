include ../../../mk/gnu.pre.mk

DISTNAME=       curl
VERSION=        7.21.0
CATEGORIES=     devel
HOMEPAGE=       http://curl.haxx.se/
MASTER_SITES=   http://curl.haxx.se/download
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2
GNU_CONFIGURE=  yes

# might want to add c-ares and ldap at some point
DEPENDS+= "openssl/1.0.0a --lib"
DEPENDS+= "zlib/1.2.5 --lib"
DEPENDS+= "libiconv/1.13 --lib"

CONFIGURE_ARGS+= --with-iconv=$(PREFIX_libiconv)
CONFIGURE_ARGS+= --with-ssl=$(PREFIX_openssl)
CONFIGURE_ARGS+= --with-zlib=$(PREFIX_zlib)

DESCRIPTION=    "curl is a command line tool for transferring data with URL syntax, supporting FTP, FTPS, HTTP, HTTPS, SCP, SFTP, TFTP, TELNET, DICT, LDAP, LDAPS, FILE, IMAP, SMTP, POP3, RTMP and RTSP."

include ../../../mk/gnu.post.mk

