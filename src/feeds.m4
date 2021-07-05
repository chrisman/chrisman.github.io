define(__title, `Feeds')
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

This is a collection of rss/atom feeds for my content. In case you're not that into "websites".

- [👩‍💻 chrismanbrown.gitlab.io](https://chrismanbrown.gitlab.io/rss.xml)
- [📚 goodreads updates](https://www.goodreads.com/user/updates_rss/409485?key=iTLsRGWgZW_58kOJsW8nfX7nJ5DESrKG3c5nY_bUr0QqpVyP)
- [🐘 fediverse](http://mastodon.social/@cpb.rss)
- [🚀 gemlog (gemini)](gemini://breadpunk.club/~bakersdozen/gemlog/atom.xml)

Inspiration for a Feeds page:

<https://marcus.io/blog/making-rss-more-visible-again-with-slash-feeds>

changequote`'dnl change quotes `back to default'
include(src/footer.html)
