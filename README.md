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

1. Post titles are a numerical sequence. Start a new `.m4` doc in `/src` with a title of the next number. Define `__last` in it, and undefine `__last` in the previous "last" file.

2. Increment LATEST in Makefile

3. make

4. To publish, push to master.

## References

This is almost *exactly* [Technomany's set up](https://github.com/technomancy/technomancy.us)
