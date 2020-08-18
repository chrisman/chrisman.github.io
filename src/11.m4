define(__timestamp, 2020-07-07)dnl
define(__title, `on bookmarks and note taking')dnl
define(__subtitle, `I am moving my collection of links from a naive bookmarking system to a more intentional centralized knowledge base.')dnl
define(__keywords, `bookmarks, learning, github, wiki, note taking')dnl
define(__id, 11)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Contents

1. A Personal History
2. A Fractured Landscape
3. Bookmarking: Why Even Do A Thing?
4. More On Type 2 Bookmarks
5. Deplatforming my bookmarks
6. Conclusion
7. Resources

## A Personal History

The happiest I've ever been with my bookmarks was when I used [del.icio.us](https://en.wikipedia.org/wiki/Delicious_(website)) back in the aughts. The things I  liked about it best are:

1. Simplicity: It worked via a bookmarklet.

2. Organization: I could tag bookmarks, and organize tags into categories of tags, and 

3. Sharing: I could easily share a tag or group of tags with a friend or collaborator.

I remembering seeing, I think it was Warren Ellis's collection of tags and bundles on del.icio.us around this time, and it was an astounding collection of research.

Nothing I've used since then has been as good at organization and exporting/sharing.

I started using [Pocket](https://en.wikipedia.org/wiki/Pocket_(service)) probably also in the aughts, back when it was still Read It Later, and have consistently been just sorta content with it. There's no good way to share tags or groups of tags, and there's no kind of meta-organizing of tags. But it allows me to save stuff to read and reference later.

It is the minimally viable bookmarking product. And now it is owned by Mozilla and for some reason it is also part of Firefox, so it's constantly available. (Even though I use the service myself, I go back and forth between feeling like this integration is convenient, and like it is being shoved in my face.)

I know there are other products out there. Especially [pinboard](http://pinboard.in/t), which I think might be the holy grail of bookmarking for me, but I haven't yet been willing to shell out $$$ for a subscription to a service that offers no trial.

## A Fractured Landscape

The other problem with bookmarks is that it is really, really hard for me to commit to keeping them all in one place while so many sites offer their own "save" functions.

Many of my bookmarks remain in the form of saved comments and posts on reddit, saved links on lobste.rs and hackernews, saved videos and playlists on youtube, favorited posts on twitter and mastodon, "starred" content in my rss reader, etc. So trying to find "saved" content later often means visiting all those sites and more looking for where I saved the damn thing. Sometimes they're saved for some reason in my browser bookmarks, which is the least flexible way to save bookmarks.

## Bookmarking: Why Even Do A Thing?

Why bookmark things?

From on my own experiences, there are two primary reasons:

1. To create a [Someday/Maybe](https://en.wikipedia.org/wiki/Getting_Things_Done#Workflow) or Read It Later list. This link is something that looked interesting to you, but wasn't interesting enough for you to read at the time. Some of these items will actually get read at some point, but many more will not. There's an element of hoarding to collecting these kind of bookmarks. I think it stems in part from a sort of anxiety rooted in [the belief that you might be missing out on something](https://en.wikipedia.org/wiki/Fear_of_missing_out). In this case, missing out on access to the knowledge contained in the bookmarked resource.

    I try to avoid making these <abbr title="Fear Of Missing Out">FOMO</abbr> bookmarks, because they just sit there, not getting read, but still taking up space and mental bandwidth every time you look at your bookmarks and see them, and once again promise yourself, "Someday..." 

2. To create references, sources, and quotes that you will refer back to in your own writing or in the course of your own work. This kind of bookmarking feels more "correct" to me. Or at least much more useful and more productive.

## More On Type 2 Bookmarks

The primary value in a type 2 bookmark is, again, extracting content from it. Creating a reference and a context.

The ability to comment on or annotate a bookmark is a feature I have seen absolutely nowhere since the old days of Google Reader.

There was a redditor I saw commenting on current events stories around 2016 - 2017 who must have had a fantastic Type 2 Bookmarking workflow. The remarkable thing about their posts is that nearly every single *sentence* would have between 1 - 3 citations to a variety of news sources backing up their claims.

A simple collection of links wouldn't allow for such recall. They must have had snippets and summaries ready to go for each topic on which they commented.

It is this sort of "Type 2" content that I've been collecting from all the books I've read the past few years. I have found this process of note taking to be so useful that I have finally come to consider reading books a waste of time unless I do it.

Unless, that is, I am reading for leisure, in which case I rarely care whether I can remember the particulars of the content in a month's time. The point of reading such a book is to experience the feelings of having read it. Not to absorb any factual content from it.

But if it's a book that I'm reading to gain practical knowledge and know-how, then of course, most certainly, if that knowledge and know-how fades over the course of a couple months to a year, then how is it not wasted time?

The same holds true of bookmarks. If you don't capture some kind of content or context from the bookmarked material, then the bookmark becomes opaque and its significance, meaning, and value degrades with time.

That's one of the reasons that Type 1 / FOMO bookmarks so rarely get read.

## Deplatforming my bookmarks

So here's an endeavor that I've been undertaking for the last couple of weeks.

I am deplatforming my bookmarks.

What this looks like is going through all the platforms I mentioned above, and assessing all of my saved items, and then migrating *content* to a single knowledge database.

Type 1 bookmarks are for the most part simply deleted. If I haven't read them by now, I ain't gonna.

Type 2 bookmarks are reevaluated for their content. Useful, interesting content that I will want to refer back to is entered into [my personal wiki](https://github.com/chrisman/knowledge/wiki), and the bookmark is added as a source for that content.

This immediately feels so much better! I'm no longer collecting opaque URLs. I am collecting *information* and *content* and the links are a side effect and a source for that content.

My "tags" are pages in my wiki. "Bundles" emerge through linking pages. It's easier to see and follow links between concepts. And concepts gain depth and validity as more sources are added.

The additional benefits of keeping all this content in a GitHub wiki include:

1. git: having all my info in version control and on multiple computers, with access to command line tools to search and format text.

2. web access: the added convenience of web interface, so I can edit and view in the browser and on mobile.

## Conclusion

I'll probably continue to use something like Pocket to form a queue of content to be processed. Because putting the content in the knowledge base is certainly more work than the one-click "save to pocket" feature in my browser. But I intend to continue with this exercise because it feels really great.

So allow me to revize my requirements of a bookmarking system, and to evaluate this new systems by these requirements:

1. Centralized: no more searching through multiple sites to find the reference I'm looking for.

    Score: Passing, with a qualifier. It offers the *promise* of a fully centralized collection, but there is still the process of deplatforming that content, because honestly I'm still going to save stuff on reddit and on pocket for the sake of ease and convenience.

2. Simple: be able to capture a bookmark quickly and easily.

    Score: Neutral. Entering content into the knowledge base takes much longer than a single click-to-save. Solution: continue using convenient things like Pocket and Reddit, and continue migrating content from those platforms to the knowledge base. (See point #1 above.)

2. Organized: have tags and ideally "bundles" of tags, and the ability to see links and connections between tags.

    Score: Passing. Pages and hyperlinks as tags and connections is great so far, and has lead to more connections between ideas.

3. Sharing: be able to share tags and content with others.

    Score: Passing. Instead of linking to tags, I can share a URL to a page on the wiki. It's too bad that the "Watch" feature doesn't (I think) tell people when a wiki is updated. One of the coolest features of old del.icio.us and current pinboard is that every tag has an RSS feed you can subscribe to!

Total score: passing!

## Resources

- meta-knowledge: a list of people who learn things in public on GitHub.

    <https://github.com/RichardLitt/meta-knowledge>

- note taking

    - Zettelkasten: a note taking method that HN is obsessed with right now. Originally used index cards, now uses hipster Electron apps.

        <https://writingcooperative.com/zettelkasten-how-one-german-scholar-was-so-freakishly-productive-997e4e0ca125>

    - Commonplace Book: a method for collecting, linking, and indexing written notes.

        <https://publicdomainreview.org/collection/john-lockes-method-for-common-place-books-1685>
    
    - Org Mode: included here for completeness. People [do NOT shut up about org mode](https://tiny.tilde.website/@cpb/104230682765018604).

changequote`'dnl change quotes `back to default'
include(src/footer.html)

