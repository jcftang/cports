all:
	@echo "Try: make test"
	@false

runtests: 
	./test.sh

runtests-gnu: runtests
	./tgnu.sh
	./tbuild.sh

runtests-intel: runtests
	./tintel.sh

test:
	../scripts/wvtestrun $(MAKE) runtests

test-gnu:
	../scripts/wvtestrun $(MAKE) runtests-gnu

test-intel:
	../scripts/wvtestrun $(MAKE) runtests-intel

clean::
	rm -f *~ t/*~
