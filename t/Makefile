all:
	@echo "Try: make test"
	@false

runtests:
	./test.sh
	./tgnu.sh

test:
	../scripts/wvtestrun $(MAKE) runtests

clean::
	rm -f *~ t/*~
