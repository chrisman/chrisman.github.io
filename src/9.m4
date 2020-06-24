define(__timestamp, 2020-06-17)dnl
define(__title, `m4')dnl
define(__subtitle, `the one true templating language')dnl
define(__keywords, `m4')dnl
define(__id, 9)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Contents

1. Background
2. Exposure
3. First Steps
4. Catalyst
5. Adoption
6. Conclusion

## Background

> m4 is a macro processor, in the sense that it copies its input to the output, expanding macros as it goes
>
> <https://www.gnu.org/savannah-checkouts/gnu/m4/manual/m4-1.4.18/m4.html#Preliminaries>

m4 is a core gnu utility, and is installed by default on most *nix systems. Every one that I've encountered, in fact. Including macOS.

I consider myself a pretty serious command line nerd and am familiar with `sed`, `awk`, `grep`, `cut`, `sort`, `tr`, etc. But I had never heard of this macro processor. It seemed very mysterious and obscure when I first encountered it.

## Exposure

I'm not 100% when and where I first encountered m4. It very well may have been in the [colophon of technomancy.us][colophon] where the author boasts that the entire site is "published via GNU M4, rsync, and a 12-line Makefile," which was super attractive to the minimalist in me.

I then remember reading [*Notes on the M4 Macro Language*][mbreen] on my phone in the airport lounge on my way off to vacation somewhere, trying to learn more about this mysterious little program that has been under my nose this whole time.

Later I found [apostl] on github, a tiny wrapper for m4 with the goal of easily including partials in your HTML. This was an application that resonated with me: a zero overhead, framework-free way of modularizing HTML for people like me who just want to write static content with no extra tools or bloat.

Finally I can abstract out my header, footer, and nav components, and include them where ever I want.

[colophon]: https://technomancy.us/colophon
[mbreen]: https://mbreen.com/m4.html
[apostl]: https://github.com/vkitchen/apostl

## First Steps

What I wanted from m4 was to be able to drop an `<!include(nav.md)!>` and an `<!include(footer.md)!>` in my markdown and introduce a little bit of modularity into my workflow.

I did this for a hot minute, and it was great. I had expandable macros embedded in my markdown. I could pipe each markdown file through m4 to expand it, and then pipe the assembled markdown through pandoc to create an HTML page.

It was glorious.

Except, I couldn't help the feeling that it could be *better*. I was still doing a lot of things by hand like updating the "all posts" page of my blog. And I had the sneaking suspicion that things could get a lot more *programmatic* if I could only fully grasp the potential of these macros.

Still, it was good enough.

## Catalyst

Until it wasn't.

The catalyst for full adoption, for a deep dive into the potential of m4, came from something I never thought I'd ever see.

I started trying to blog on my new [pinebook]. This arm64 system not only didn't have pandoc installed, but pandoc wasn't even in the software repository. I considered compiling it myself, but the language it is written in, Haskel, doesn't even compile on arm64.

The thing I thought I'd never see is a computer with no pandoc.

So I started down the path of removing all markdown from my blog, resigning myself to writing HTML. And I eventually reversed that decision because I hate writing HTML that much, and went back to writing markdown again and simply using a markdown to HTML converter that isn't pandoc.

Pandoc is honestly overkill for just converting markdown to HTML. I don't need a swiss army knife. I need a butter knife.

But between removing markdown and putting it back, I spent an afternoon with Technomancy's makefile and m4 docs, and really started to understand.

[pinebook]: https://store.pine64.org/product/14%e2%80%b3-pinebook-pro-linux-laptop-ansi-us-keyboard-estimated-dispatch-in-december-2019/

## Adoption

The first thing I really missed about losing pandoc was setting metadata in the YAML frontmatter.

Easy fix, though. That all became macro definitions at the top of the document:

```
<!define(__timestamp, 2020-06-17)dnl!>
<!define(__title, `m4')dnl!>
<!define(__subtitle, `the one true templating language')dnl!>
<!define(__id, 9)dnl!>
```

Then the content gets sandwiched between the includes that I first fell in love with:

```
<!include(src/header.html)!>
markdown markdown markdown
<!include(src/footer.html)!>
```

And the reason that works so well is--and I never thought I'd ever hear myself say this--because of the beauty of global state!

Any macro you define in Document A is available to Document B if you include Document B from Document A.

So the title, subtitle, etc is available to header.html in this case. Where I can set `<title>` in the head and drop an `<h1>` in the body, much like pandoc did.

Finally, I learned to change the default quote strings. Because when writing markdown full of `code blocks`, it simply does not do to have m4 trying to escape a string every time it encounters a backtick.

So now a blog post looks like this:

```
<!define(__timestamp, 2020-06-17)dnl!>
<!define(__title, `m4')dnl!>
<!define(__subtitle, `the one true templating language')dnl!>
<!define(__id, 9)dnl!>
<!include(src/header.html)!>
<!changequote(<!,!>)dnl Or else `code blocks` confuse m4!>
markdown markdown markdown markdown 
<!changequote`'dnl change quotes `back to default'!>
<!include(src/footer.html)!>
```

Now here are two things I lifted straight from Technomancy: populating the "All posts" list, and auto-populating the rss feed.

Here's how to implement a "countdown" for loop in m4, straight from *Notes on the M4 Macro Language* with minor modifications:

```
<!define(`for',`ifelse($#,0,``$0'',`ifelse(eval($2>=$3),1,!>
  <!`pushdef(`$1',$2)$4`'popdef(`$1')$0(`$1',decr($2),$3,`$4')')')')!>
```

Gross, right? m4 is great for macros and includes. Not super fun for general programming. But, like immigrants, it gets the job done.

So now "all posts" and rss.xml can both, with the introduction of one "LATEST" variable defined in the Makefile (which tells the macros how many files there are in total), iterate over all the files and load them, diverting their output to a throwaway register but retaining their macro definitions. So it's possible to yank the title and timestamp from each post, for example, and spit them out into the list of all posts. [Like so](https://github.com/chrisman/chrisman.github.io/blob/a2a949f3f43613ea1a87677162e34f9138f6804c/src/list.m4).

The final bit of cleverness that I borrowed from Technomancy was to have header.html and footer.html either, depending on the precense of a "__feed" macro passed in by the Makefile, wrap the post up in an HTML document for the blog or an XML document for the feed. [Like so](https://github.com/chrisman/chrisman.github.io/blob/a2a949f3f43613ea1a87677162e34f9138f6804c/src/header.html#L1).

## Conclusion

m4 is fantastic for quick macro expansion and for including files.

But it quickly becomes super unwieldly when you need, say, to implement a for loop or do much of anything programmatic at all.

It is difficult to debug. I quickly found my default behavior when encountering something unexpected is to just increase the escape quotes around something. That often fixed it.

That said, it is an interesting language, and I found it rewarding to learn and work with, and I'll probably reach for it again if I have the opportunity to.

I'm perfectly happy with the current state of writing for this blog. I feel like I'm 90% of the way there to my original vision of "plain markdown with includes," and the additional m4 doesn't really bother me in the slightest. It's still really clean, with almost all of the complexity and ugly stuff moved away from where I write into auxiliary files.

changequote`'dnl change quotes `back to default'
include(src/footer.html)

