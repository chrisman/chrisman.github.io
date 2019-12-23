markdowns := $(shell find src/posts -type f)
htmls := $(patsubst src/posts/%.md, posts/%.html, $(markdowns))

all: index posts

index: index.html

index.html: src/index.md
	pandoc -s -c styles/reset.css -c styles/main.css -c styles/index.css -o $@ $<

posts: $(htmls)

posts/%.html: src/posts/%.md
	pandoc -s --toc -c ../styles/reset.css -c ../styles/main.css -o $@ $<