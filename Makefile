markdowns=$(wildcard src/posts/*.md)
posts=$(markdowns:src/posts/%.md=posts/%.html)

MAKE_POST=pandoc -s --toc --highlight-style breezeDark -c ../styles/reset.css -c ../styles/main.css -o
MAKE_INDEX=pandoc -s --toc -c styles/reset.css -c styles/main.css -H src/header -o 


.PHONY: all
all: markup


.PHONY: markup
markup: index.html uses.html $(posts)
%.html: src/%.md
	@echo making $@
	@$(MAKE_INDEX) $@ $<
posts/%.html: src/posts/%.md
	@echo making $@
	@$(MAKE_POST) $@ $<


.PHONY: clean
clean: index.html $(wildcard posts/*.html)
	@echo delete $^
	@rm $^
