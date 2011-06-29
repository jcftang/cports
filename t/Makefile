BIN=$(wildcard *.sh)

all:
	@echo "Try: make test"
	@echo "	or make test-gnu"
	@echo "	or make test-intel"
	@false

runtests: $(BIN)
	@chmod u+x $(BIN)
	./t1000-test.sh

runtests-gnu: runtests
	./t2000-gnu.sh
	./t3000-build.sh
	./t3010-gnutbootstrap.sh

runtests-intel: runtests
	./t2000-intel.sh

test:
	../scripts/wvtestrun $(MAKE) runtests

test-gnu:
	../scripts/wvtestrun $(MAKE) runtests-gnu

test-intel:
	../scripts/wvtestrun $(MAKE) runtests-intel

clean::
	rm -f *~ t/*~

.PHONE: $(BIN)
