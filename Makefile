index: .make.index

sources := $(shell find src/posts -type f)
outs := $(patsubst src/posts/%.md, posts/%.html, $(sources))


all: index posts


index: index.html

index.html: src/index.md
	pandoc -s -c styles/reset.css -c styles/main.css -c styles/index.css -o $@ $<


posts: $(outs)

posts/%.html: src/posts/%.md
	pandoc -s --toc -c ../styles/reset.css -c ../styles/main.css -o $@ $<
