tags: #blogging #make #css #pandoc

# How To Start A Blog

I decided to start blogging again.

## Why

Why start a blog?

1. Reflection
2. Sharing
3. Craft

### Reflection

Writing is thinking. It helps me investigate and explore my beliefs, and to
examine them and articulate them. Helps me get organized about the things I
think are true. This has always been true for me. The act of thinking and
writing brings joy.

### Sharing

Writing for myself would be satisfying enough. I've done plenty of that. But at
this point I have enough coworkers and mentees with whom I want to share things
that are interesting to me and that I have learned, in hopes that these things
are useful to others.

### Craft

I build things for a living. Building a blog/website is an opporunity to create
something on my own terms, in the way I want to. To explore and reject
technologies to the extent that I choose.

## History

I used to really enjoy making websites as a human and amatuer "webmaster".
These usually took the form of blogs.

I still do. But I used to, too.

Now I make websites and webapps professionly, for a living.

I still like it. I haven't given up on the web or anything. But it is much more
complicated now. It's harder.

### Personal History

I have started, and then ended, plenty of blogs over the years, starting in the
90s with writing longform HTML/CSS/JavaScript in Notepad.exe and
uploading it via FTP to remote servers.

This was the best!

Check out these problems and their solutions:

- layout? tables

- styles? inline

- javascript? inline. a silly, toy language. only good for `onClick` or
  mouseover effects like window.alert or changing the color of a button.

- editor? notepad

- buildtools? none. write it all by hand, and what you write is what you serve.
  ftp it to a remote server.

I don't mean to over romanticize it, or be nostalgic for the way things were. A
lot of it sucked in retrospect. But a lot of it was great, and it was exciting
times.

Before popular blogging platforms, typically you just continued to update the
same HTML or TXT file, adding new updates to the top of the file. Perfectly
simple. Literally there is nothing easier. I do long for simplicity.

Anyway. After those early days came a lot of blogging platforms.

I did LiveJournal for a long time, then Blogger/Blogspot (my longest running
blog, all about biking in Denver), Tumblr (briefly), and Wordpress (most
briefly).

These platforms did or did not make creating content more easy. Whether they
did or did not, it certainly came at the cost of control and ownership.

And now, finally, here I am, once again wanting to write some thoughts down and
share them.

I don't want to resort to somebody else's platform. I *create* platforms.

### Modern Industry History

I create platforms. And it is complicated. To a ridiculous degree. Laughably,
comically so. [Attempts to satirize the complexity](http://archive.is/orIVm)
would be more funny if they weren't just, accuate.

As a creator of web apps, here are the things I considered doing in order to
start this blog, in order of complexity:

1. I'll write my own CMS! That's some kind of a rite of passage isn't it? Some
   kind of self-hosted solution with user accounts and comments and, and, and,
   and...

2. Gatsby.js: Here's the hot new static site generator. Luckily/unluckily, I've
   used it at work, and it's okay. It's not enough for the moderately dynamic
   site we're using it for, but it's also too much for an actual simple static
   site.

3. Jekyll: okay, then. something smaller, lighter, and more static. I like this
   because it's baked into github pages, and it builds a site from simple,
   static files.

Jekyll was simple enough that it became a gateway for me. This is so simple,
that the things I don't like, I feel like I should be able to fix.

And suddenly I had convinced myself. I found myself saying, much like Kel
Mitchell, awww here it goes!


## Motivated by Minimalism

I've convinced myself to reject all blogging platforms, CMS, and static site
generators, and get back to what I originally liked about the web: writing
plain text files with minimal markup, and then uploading them.

A large portion of my motivation comes from my participation over the last year
or so in the [pubnix community](http://tilde.town/). Here is the minimalism
I've been looking for!  The simplicity. A little bit of retro-computing in
these modern times. In this community I wrote plain text files and converted
them with `pandoc`.

Then I went even more simple and got involved the gopher community
(surprisingly healthy and active) which is *nothing* but plain text files with
an index. Felt good.

### Diversion: a Rock Star Web Developer

I'm a fan of Jack White, particularly his work with the White Stripes. The
content, format, and methodology of his work are all extremely minimalist in
nature. He seems to constantly be asking "What's the least amount of *x* you
can have, and still have *y*?"

In the case of the White Stripes, "What's the least band you can have, and
still be a band?" Answer: drums and a guitar.

In the introduction to *It Might Get Loud*, he answers the question, "What is
the minimum viable guitar?" by going into a wood shop, putting a few nails in a
wood plank, winding a guitar string around them, and proceeding to play it like
a slide guitar with a glass coke bottle.

I'm especially fond of the story he tells of working in an upholstry shop, and
becoming fixated after realizing that the minimum number of staples you need to
upholster a chair is three. For White, this lead to an obession with the
number. His own [23 enigma](https://en.wikipedia.org/wiki/23_enigma), minus 20.
To me, this is just another great example of somebody exloring the question of,
How much can I take away from this and still have it work?

Finally, there is the song *Little Room* from White Blood Cells, which is short
enough to post here in its entirety:

> When you're in your little room, and you're working on something good<br>
> Well if it's really good, you're gonna need a bigger room<br>
> And when you're in the bigger room, you might not know what to do<br>
> You might have to think of how you got started sitting in your little room

A veritable four-line textbook on how minimalist constraints fuel and feed
creativity.

Anyway. I think Jack White would *hate* the state of modern web development.

## Tactics

So how do we get back to simple?

Here's the bare minimum requirements for a blog site:

1. Content
2. Style
3. Build
3. Hosting

### Content

Content is plain text files with minimal, mostly structural markup via Markdown.

### Style

Most sites are grossly over-styled. As a reader, I spend most of my time in
Reader Mode anyway to disable styles so I can simply read content.

As a result, I want my own styles to be plain, minimal, non-invasive, and and
focused on making text easy to read.

I don't necessarily want something like
[Bjarne Stroustrup's homepage](http://www.stroustrup.com/):
that's not enough staples, in our upholstry metaphor. It's *too* minimal, to
the degree that it makes it hard to read.

I need three nails worth of styling.

Here are the things I considered when making up the styles for this site:

1. Type
1. Reset
2. Scale
3. Color

#### Type

Didn't spend much time here.

Wanted a nice monospace serif font for body text, so I went with good old
classic Courrier New.

For headings, I wanted a good looking sans-serif, and went with Montserrat.

#### Reset

If I'm doing everything myself, by hand, then I might as well go all in, and
exercise control over all the details of my site.

I did a dang [CSS reset](https://cssreset.com/scripts/eric-meyer-reset-css/).

#### Scale

After the CSS reset, one of the first things I got to consider was styling all
the header elements.

I used type-scale.com to pick out a scale. I settled on a
[Major Third](https://type-scale.com/?size=18&scale=1.250&text=A%20Visual%20Type%20Scale&font=Montserrat&fontweight=700&bodyfont=Poppins&bodyfontweight=400&lineheight=1.45&backgroundcolor=white&fontcolor=%23333&preview=false)
scale because it looked good to me.

I like the idea of a Golden Ratio scale in theory, because I like the Golden
Ratio, but in practice, it's too damn big.

#### Color

I don't know. I made this part up. Here were my guidelines.

1. Dark mode: I like light text on a dark background

2. Use named colors where possible. I'm not positive about this as a rule. It
   seemed to narrow down the infinite number of colors to a few dozen from
   which to choose.

3. Accessability: all color contrast is rated AA or AAA.

### Build

This used to not even be a thing. You'd just write your HTML files and then
upload them to a server.

But now you have babel and webpack and all kinds of transpiling and whatnot.

Which is not a bad thing! It allows for great language features. But I do think
that many people don't know that it doesn't have to be this way. You can create
an amazingly simple build process that doesn't require babel, webpack, gulp, or
even node or `package.json`.

My build process for this site includes simply `make` as a wrapper for `pandoc`.

#### pandoc

Converts markdown to HTML. Among other things. Quite a useful utility in fact.
Check it out: `brew install pandoc`.

#### Make

I've always known that Make is a thing. A thing from the Olden Times. A standby
of C/C++ hackers. But my interaction with it has always been limited to
reciting the incantation: `./configure && make && make install`.

But I've always appreciated the elegance of the basic formula:

```
target: prerequisite
  recipe
```

Very plain, very organized. I've heard people say that a well written Makefile
is like documentation for a project, and I can understand that a little bit.

So I've always wanted an excuse to learn `make`, and it seemed like a good,
minimalist fit for this project. I certainly didn't want to install webpack, or
grunt or gulp, or anything like that.

It took me a minute to learn <del>all</del> enough of Make's magic variables
and builtin functions. What it *really* took me a minute to wrap my head around
was this: I was trying to write a recipe that targets a bunch of HTML files.
But I didn't *have* those HTML files, nor did I necessarily know what they
*are*. What I did have is a list of prerequisites: a bunch of Markdown files.
The trick was to ..

I use it to watch for the creation of source files (markdown files) and then
create HTML files from them.

It's not fantastic. It's not easy, but it is simple. And it's ubiquitous and
transferable.

### Hosting

Github pages. Easy nuff.

## Resources

### Make

- https://www.olioapps.com/blog/the-lost-art-of-the-makefile/
- https://blog.mindlessness.life/2019/11/17/the-language-agnostic-all-purpose-incredible-makefile.html
- https://jblevins.org/log/markdown-makefiles

### Glossary

<dl>
</dl>
