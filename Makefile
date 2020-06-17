LATEST=8

SRC=$(shell find src/*.m4 ! -name "feed.m4")
OUTS=$(patsubst src/%.m4,%.html,$(SRC))

all: index.html $(OUTS) rss.xml
index.html: src/$(LATEST).m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > $@
%.html: src/%.m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > $@
rss.xml: src/feed.m4
	@m4 -D__latest=$(LATEST) $< > $@
watch: ; @echo $(SRC) | tr " " "\n" | entr -r make
serve: all ; @python -m SimpleHTTPServer 3001
clean: ; rm *.html rss.xml
