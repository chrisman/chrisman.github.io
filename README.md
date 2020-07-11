# blog

this is the source for [chrisman.github.io](https://chrisman.github.io)

if you would like a blog like this, I created a more versatile template / boilerplate for you at [chrisman/m4-blog](https://github.com/chrisman/m4-blog), because I like you. 

## Structure

```
.
├── Makefile
├── README.md
├── rss.xml     # 6.
├── *.html      # 5.
├── posts       # 1.
├── src         # 2.
│   ├── drafts  # 3.
└── styles      # 4.

4 directories, 60 files
```

1. preverved for historical purposes. might delete later.
2. m4s and mds
3. ideas, brain dump, someday/maybe
4. css
5. all the HTML generated from `/src/*.m4`
6. xml generated as part of the build process

## How to blog

1. Increment the number in LATEST. Start writing `/src/<number>.m4`

2. (optional) start a dev server: `make serve`

3. (optional) start a watcher: `make watch` (requires entr: `brew install entr`)

3. build: `make`

4. publish: push to master.

## References

This is almost *exactly* [Technomany's set up](https://github.com/technomancy/technomancy.us)
       
