all:
	@echo "Try: make test"
	@false

runtests: 
	./test.sh

runtests-gnu: runtests
	./tgnu.sh

runtests-intel: runtests
	./tintel.sh

test:
	../scripts/wvtestrun $(MAKE) runtests

test-intel:
	../scripts/wvtestrun $(MAKE) runtests-intel

clean::
	rm -f *~ t/*~
