LATEST := $(shell cat LATEST)

SRC=$(shell find src/*.m4 ! -name "feed.m4")
OUTS=$(patsubst src/%.m4,%.html,$(SRC))

all: $(OUTS) rss.xml index.html
index.html: src/$(LATEST).m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html-smart > $@
%.html: src/%.m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > $@
rss.xml: src/feed.m4
	@m4 -D__latest=$(LATEST) $< > $@
watch: ; @echo $(SRC) | tr " " "\n" | entr -r make
serve: all ; @python -m http.server 3001
clean: ; rm *.html rss.xml
glossary: ; @grep -H -B 1 "^:" src/*.m4
