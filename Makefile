LATEST := $(shell cat LATEST)

SRC=$(shell find src/*.m4 ! -name "feed.m4")
OUTS=$(patsubst src/%.m4,public/%.html,$(SRC))

all: $(OUTS) public/rss.xml public/index.html
public/index.html: src/$(LATEST).m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html-smart > $@
public/%.html: src/%.m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html-smart > $@
public/rss.xml: src/feed.m4
	@m4 -D__latest=$(LATEST) $< > $@
watch: ; @echo $(SRC) | tr " " "\n" | entr -r make
serve: all ; cd public ; python -m http.server 3001
clean: ; rm public/*.html public/rss.xml
glossary: ; @grep -H -B 1 "^:" src/*.m4
