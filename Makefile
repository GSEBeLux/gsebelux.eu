#!Makefile

HUGO=hugo-extended

.PHONY: build serve draft clean travis netlify

default all: build

build:
	$(HUGO) --minify
	@find public/ -name '*.html' ! -name '*.gz' -type f -exec sh -c "gzip -c -9 < {} > {}.gz" \;
	@find public/ -name '*.css' ! -name '*.gz' -type f -exec sh -c "gzip -c -9 < {} > {}.gz" \;
	@find public/ -name '*.js' ! -name '*.gz' -type f -exec sh -c "gzip -c -9 < {} > {}.gz" \;

travis:
	$(MAKE) HUGO=./hugo build

netlify:
	hugo --minify --quiet --baseURL="$DEPLOY_PRIME_URL"

draft:
	$(HUGO) --minify --buildDrafts --buildFuture --buildExpired

serve:
	$(HUGO) server --disableFastRender --watch

clean:
	@rm -rf public/
	@rm -rf resources/
