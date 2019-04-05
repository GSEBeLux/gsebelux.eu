#!Makefile

HUGO=hugo

.PHONY: build serve draft clean

all: build

build:
	$(HUGO) --minify

travis:
	$(MAKE) HUGO=./hugo build

draft:
	$(HUGO) --minify --buildDrafts --buildFuture --buildExpired

serve:
	$(HUGO) server --disableFastRender

clean:
	@rm -rf public/
	@rm -rf resources/
