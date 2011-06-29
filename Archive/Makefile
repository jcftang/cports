VERSION=$(shell cat ../VERSION)

# If ikiwiki is available, build static html docs suitable for being
# shipped in the software package.
ifeq ($(shell which ikiwiki),)
IKIWIKI=@echo "** ikiwiki not found, skipping building docs" >&2; true
## NO_IKIWIKI=1
else
IKIWIKI=ikiwiki
endif

all: docs 

docs:
	$(IKIWIKI) doc html -v --wikiname cports --plugin=goodstuff \
		--no-usedirs --disable-plugin=openid --plugin=sidebar \
		--disable-plugin=shortcut \
		--disable-plugin=smiley \
		--plugin=comments --set comments_pagespec="*" \
		--exclude='news/.*'
ifdef NO_IKIWIKI
	$(MAKE) import-docs
endif

clean:
	rm -rf html doc/.ikiwiki

.PHONY: docs
