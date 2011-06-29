include ../../../mk/gnu.pre.mk

DISTNAME=	mksh
VERSION=	R39c
CATEGORIES=	shells
HOMEPAGE=	https://www.mirbsd.org/mksh.htm
MASTER_SITES=	https://www.mirbsd.org/MirOS/dist/mir/mksh
MASTER_SITES+=	http://pub.allbsd.org/MirOS/dist/mir/mksh
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES= 	$(DISTNAME)-$(VERSION).cpio.gz
PKGSUBDIR=	mksh
EXTRAVERSION=

CPIO_FLAGS+= -midu
PRECREATE_DIRS+=bin

DESCRIPTION= "What is mksh(1)? . Short answer: The MirBSD Korn Shell. Okay, but"
DESCRIPTION+= "what exactly does it do, or why another shell? These questions will"
DESCRIPTION+= "be answered here for the people interested. Right now, you only need"
DESCRIPTION+= "to know that mksh is a DFSG-free and OSD-compliant (and OSI approved)"
DESCRIPTION+= "successor to pdksh, developed as part of the MirOS Project as native"
DESCRIPTION+= "Bourne/POSIX/korn shell for MirOS BSD, but also to be readily available"
DESCRIPTION+= "under other UNIX®-like operating systems."

do-build:
	$(QUIET)cd $(WORKDIR); \
        $(CPIO) $(CPIO_FLAGS) < $(DISTNAME)-$(VERSION).cpio;
	$(QUIET)cd $(WRKSRC); \
	$(CHMOD) +x ./Build.sh; \
	./Build.sh

do-install:
# Installing the shell:
# install -c -s -o root -g bin -m 555 mksh /bin/mksh
# grep -x /bin/mksh /etc/shells >/dev/null || echo /bin/mksh >>/etc/shells
# install -c -o root -g bin -m 444 dot.mkshrc /usr/share/doc/mksh/examples/
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -c -m 555 $(WRKSRC)/mksh $(PROGRAM_PREFIX)/bin/mksh
	$(INSTALL) -d $(PROGRAM_PREFIX)/share/doc/mksh/examples
	$(INSTALL) -c -m 444 $(WRKSRC)/dot.mkshrc $(PROGRAM_PREFIX)/share/doc/mksh/examples

# Installing the manual:
# install -c -o root -g bin -m 444 mksh.cat1 /usr/share/man/cat1/mksh.0
# or
# install -c -o root -g bin -m 444 mksh.1 /usr/share/man/man1/mksh.1
	$(INSTALL) -d $(PROGRAM_PREFIX)/man/man1
	$(INSTALL) -c -m 444 $(WRKSRC)/mksh.1 $(PROGRAM_PREFIX)/man/man1

include ../../../mk/gnu.post.mk
