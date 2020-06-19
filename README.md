# blog

this is a blog

## Structure

```
.
├── Makefile
├── README.md
├── rss.xml
├── *.html
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

## How to blog

1. Increment the number in LATEST. Start `./src/<number>.m4`

3. build: `make`

4. publish: push to master.

## References

This is almost *exactly* [Technomany's set up](https://github.com/technomancy/technomancy.us)
