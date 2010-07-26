#VERSION=HEAD
VERSION=$(shell git describe)
DISTNAME=cports
DISTFILE=$(DISTNAME)-$(VERSION)

default:

dist: $(DISTNAME).tar

$(DISTNAME).tar:
	@mkdir -p releases
	@git archive --format tar --prefix $(DISTFILE)/ -o releases/$(DISTFILE).tar $(VERSION)
	@bzip2 releases/$(DISTFILE).tar

clean:
	#@-rm $(DISTFILE).tar
