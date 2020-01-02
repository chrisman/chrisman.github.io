markdowns=$(wildcard src/posts/*.md)
htmls=$(markdowns:src/posts/%.md=posts/%.html)

MAKE_POST=pandoc -s --toc --highlight-style breezeDark -c ../styles/reset.css -c ../styles/main.css -o
MAKE_INDEX=pandoc -s --toc -c styles/reset.css -c styles/main.css -H src/header -o 


.PHONY: all
all: markup


.PHONY: markup
markup: index.html $(htmls)
index.html: src/index.md
	@echo making $@
	@$(MAKE_INDEX) $@ $<
posts/%.html: src/posts/%.md
	@echo making $@
	@$(MAKE_POST) $@ $<


.PHONY: clean
clean: index.html $(wildcard posts/*.html)
	@echo delete $^
	@rm $^
