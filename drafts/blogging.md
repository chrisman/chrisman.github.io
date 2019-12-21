tags: #blogging #make #css #pandoc

# How To Start A Blog

I decided to start blogging again.

## Why

Why start a blog?

1. Reflection
2. Sharing
3. Craft

### Reflection

Writing is thinking. It helps me investigate and explore my beliefs, and to examine them and articulate them. Helps me get organized about the things I think are true. This has always been true for me.

### Sharing

Writing for myself would be satisfying enough. I've done plenty of that. But at this point I have enough coworkers and mentees with whom I want to share things that are interesting to me and that I have learned, in hopes that these things are useful to others.

### Craft

I build things for a living. Building a blog/website is an opporunity to create something on my own terms, in the way I want to. To explore and reject technologies to the extent that I choose.

## History

I used to really enjoy making websites as a human and amatuer "webmaster".
These usually took the form of blogs.

I still do. But I used to, too.

Now I make websites and webapps professionly, for a living.

I still like it. I haven't given up on the web or anything. But it is much more complicated now. It's harder.

### Personal History

I have started, and then ended, plenty of blogs over the years, starting in the
90s with writing longform HTML/CSS/JavaScript in Notepad.exe and
uploading it via FTP to remote servers.

This was the best!

Check out these problems and their solutions:

- layout? tables
- styles? inline
- javascript? inline. a silly, toy language. only good for `onClick` or mouseover effects like window.alert or changing the color of a button.
- editor? notepad
- buildtools? none. write it all by hand, and what you write is what you serve. ftp it to a remote server.

I don't mean to over romanticize it, or be nostalgic for the way things were. A lot of it sucked in retrospect. But a lot of it was great, and it was exciting times.

Before popular blogging platforms, typically you just continued to update the same HTML or TXT file, adding new updates to the top of the file. Perfectly simple. Literally there is nothing easier. I do long for simplicity.

Anyway. After those early days came a lot of blogging platforms.

I did LiveJournal for a long time, then Blogger/Blogspot (my longest running blog, all about biking in Denver), Tumblr (briefly), and Wordpress (most briefly).

These platforms did or did not make creating content more easy. Whether they did or did not, it certainly came at the cost of control and ownership.

And now, finally, here I am, once again wanting to write some thoughts down and share them.

I don't want to resort to somebody else's platform. I *create* platforms.

### Modern Industry History

I create platforms. And it is complicated. To a ridiculous degree. Laughably, comically so.

As a creator of web apps, here are the things I considered doing in order to start this blog, in order of complexity:

1. I'll write my own CMS! That's some kind of a rite of passage isn't it? Some kind of self-hosted solution with user accounts and comments and, and, and, and...
1. Gatsby.js: Here's the hot new static site generator. Luckily/unluckily, I've used it at work, and it's okay. It's not enough for the moderately dynamic site we're using it for, but it's also too much for an actual simple static site.
3. Jekyll: okay, then. something smaller, lighter, and more static. I like this because it's baked into github pages, and it builds a site from simple, static files.

Jekyll was simple enough that it became a gateway for me. This is so simple, that the things I don't like, I feel like I should be able to fix.

And suddenly I had convinced myself. I found myself saying, much like Kel Mitchell, awww here it goes!


## Motivated by Minimalism

I've convinced myself to reject all blogging platforms, CMS, and static site generators, and get back to what I originally liked about the web: writing plain text files with minimal markup, and then uploading them.

A large portion of my motivation comes from my participation over the last year or so in the pubnix community. Here is the minimalism I've been looking for! The simplicity. A little bit of retro-computing in these modern times. In this community I wrote plain text files and converted them with `pandoc`. Then I went even more simple and got involved the gopher community (surprisingly healthy and active) which is *nothing* but text files.


## Tactics

So how do we get back to simple?

Here's the bare minimum requirements for a blog site:

1. Content
2. Style
3. Build
3. Hosting

### Content

Content is plain text files. Markdown is luckily, conveniently, both--

1. universal, and also
2. my favorite lightweight, plain text markup language.


### Style

I get to write my own styles.

I don't actually care that much about styles. As a reader, I spend most of my time in Reader Mode anyway to disable styles so I can simply read content.

As a result, I want my own styles to be plain, minimal, non-invasive, and easy to read.

Here's the things I thought of:

1. Reset
2. Type Scale
3. Color

#### Reset

Radical, I know. But if I'm doing everything myself, by hand, then I might as well go all in, and exercise control over all the details of my site.

#### Type Scale

One of the first things I got to consider was the reset of all the header elements.

I used type-scale.com to pick out a scale. I settled on a [perfect fourth](https://type-scale.com/?size=16&scale=1.333&text=Yippee%20Skippy%20Trippy%20Blippy&font=Montserrat&fontweight=700&bodyfont=Poppins&bodyfontweight=400&lineheight=1.45&backgroundcolor=white&fontcolor=%23333&preview=false) scale because it looked good to me.

I like the idea of a Golden Ratio scale in theory, because I like the Golden Ratio, but in practice, it's too damn big.

#### Color

I don't know. I made this part up. Here were my guidelines.

1. Dark mode: I like light text on a dark background
2. use named colors where possible
3. accessability

### Build

This used to not even be a thing. You'd just write your HTML files and then upload them to a server.

But now you have babel and webpack and all kinds of transpiling and whatnot.

Which is not a bad thing! It allows for great language features. But I do think that many people don't know that it doesn't have to be this way. You can create an amazingly simple build process that doesn't require babel, webpack, gulp, or even node or `package.json`.

My build process for this site includes simply:

1. pandoc
2. make

#### pandoc

converts markdown to HTML

#### Make

An actual build tool, from the Olden Times. A standby of C/C++ hackers.

I use it to watch for the creation of source files (markdown files) and then create HTML files from them.

It's not fantastic. It's not easy, but it is simple. And it's ubiquitous and transferable.

### Hosting

github pages.

## More

### Make

- https://www.olioapps.com/blog/the-lost-art-of-the-makefile/
- https://blog.mindlessness.life/2019/11/17/the-language-agnostic-all-purpose-incredible-makefile.html
- https://jblevins.org/log/markdown-makefiles
