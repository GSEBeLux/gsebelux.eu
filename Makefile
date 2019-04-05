#!Makefile

HUGO=hugo

.PHONY: build serve draft clean travis netlify

all: build

build:
	$(HUGO) --minify

travis:
	$(MAKE) HUGO=./hugo build

netlify:
	$(HUGO) --minify --baseURL="$DEPLOY_PRIME_URL"

draft:
	$(HUGO) --minify --buildDrafts --buildFuture --buildExpired

serve:
	$(HUGO) server --disableFastRender

clean:
	@rm -rf public/
	@rm -rf resources/
