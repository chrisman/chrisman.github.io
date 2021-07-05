dnl -*- html -*-
define(__timestamp, 2020-01-01)dnl
define(__title, `Markdown and makefiles')dnl
define(__subtitle, `using Make to make websites')dnl
define(__keywords, `make, unix')dnl
define(__id, 3)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4
I wrote a makefile!

## There has always been a make

I've always known that Make is a thing.

Rather, I know that Make has always been a thing.

It was written in 1976 which, at the time of this writing, makes it a 43 year old tool, an older tool than me. At the time of this writing.

Make is a relic from the olden times, from the days of yore.  A standby of C/C++ hackers.  Something that greybeard wizards mutter and chatter and argue about as they craft and maintain their own special makefiles by hand.

But my interaction with `make` has always been limited to merely reciting that age old incantation: `./configure && make && make install` without ever delving too much into what it is and what it does. I knew that it's something you use when building code from source, but that was the extent of my knowledge.

I've always appreciated the elegance of the basic formula:

```make
target: prerequisite
  recipe
```

Or, to use a slightly different vocabulary:

```make
task: dependency
  code
```

Whichever you prefer, really:

```make
target: source
  command
```

Very plain, very organized. Simple. I've heard people say that a well written Makefile is like documentation for a project, and I can understand a little bit why they would say that. It's like reading a cookbook: a list of dishes, ingredients, and how to build those dishes from those ingredients:

```make
dish: ingredient
  recipe
```

  
## Make is a build tool

Make is a build tool, and a task runner.

You've encountered such things in your travels:

- `ant`, `maven`, and/or `gradle` if you're a Java kind of person.

- If you're a java *script* kind of person, then you've written npm scripts in your `package.json` to run your tests or start your server; and you've used grunt or gulp, or webpack.

- `rake`, if you're a ruby/rails kind of person. (Which was my first attempt at using a Make-like kind of build tool.)

It builds stuff and automates tasks.

Advantages that `make` has over other solutions like npm scripts is that:

1. It only builds a target if it needs to. (If the sources have been updated.)

2. No extra dependencies: it's pre-installed on all \*nix platforms, including macos.

3. It can wrap existing build tools! You can have `make` install your node_modules if they're missing (as long as there is a package.json), run a bash script, start your server, etc.  


## I wrote a makefile

So I've always wanted an excuse to learn `make`.

And when starting this blog, I needed a way to create HTML files from markdown source files.  I certainly didn't want to install webpack, or grunt or gulp, or anything like that. Or even npm. Minimalism is the name of our game. I don't want any other dependencies.

And so, excuse in hand, I got to cracking away at it.

It took me a minute to learn <del>all</del> enough of Make's magic variables, macros, and built-in functions. What *really* took me a minute to wrap my head around was how I had to adhere to, and work around, the basic `task > dependency > recipe` formula. There's no flexibility here. Declarative or bust.

For example: I was trying to write a recipe that targets a bunch of HTML files.  The problem is that I didn't *have* those HTML files. Nor did I necessarily know what they *are*. I didn't have a list of my targets, and that was a problem.

What I did have is a list of prerequisites: a bunch of Markdown files.

That is, given Make's strict syntax requirements, you can't just start with a bunch of ingredients and then simply build something from them. No, you must have the target *first*. Something to depend on those prerequisites. That's your entry point.

The trick was to do this:

1. Get a list of all the prerequisites. Easy enough. E.g. `find src/posts -name "*.md"`. And then,

2. Use make's super weird pattern substitution function to map that list of markdown files to a list of the HTML files I *wish I had* (my list of targets).

2. And finally, assign that list to a variable, which I can then use as a list of targets.

Being declarative is hard work some times.

That whole part looks like this:

```make
markdowns := $(shell find src/posts -type f)

htmls := $(patsubst src/posts/%.md, posts/%.html, $(markdowns))
```

Here's another way to do it using the built-in `wildcard` macro and a different, built-in substitution short hand:

```make
markdowns=$(wildcard src/posts/*.md)

htmls=$(markdowns:src/posts/%.md=posts/%.html)
```

Those targets (`htmls`) are strings that have the format of `posts/somefilename.html`.

So now, targets in hand, we get to do this:

1. Create some new task that has dependencies equal to the list of htmls. We'll call it "posts."

2. Use pattern matching to create a task for any file matching `posts/*.html`, which just happens to be the format of all htmls! This target has a dependency of its corresponding markdown file, and its recipe is the pandoc conversion.

That part looks like this:

```make
posts: $(htmls)

posts/%.html: src/posts/%.md
  pandoc --options --more-options -o $@ $<
```

Now I can call `make posts` from the command line, and every markdown file in `/src/posts` will generate a new HTML file in `/posts`! Assuming the following, of course:

1. There's not already an existing HTML file for that markdown file, AND

2. the HTML file is newer than the markdown file.

That is, it will only create the HTML file if it needs to: if it is missing, or if it is out of date.

The makefile in its entirety currently looks like this:

```make
markdowns := $(shell find src/posts -type f)
htmls := $(patsubst src/posts/%.md, posts/%.html, $(markdowns))

all: index posts

index: index.html
index.html: src/index.md
  pandoc -s -c styles/reset.css -c styles/main.css -c styles/index.css -o $@ $<

posts: $(htmls)
posts/%.html: src/posts/%.md
  pandoc -s --toc -c ../styles/reset.css -c ../styles/main.css -o $@ $<
```

(The above snippet may be out of date even as soon as the publication of this post, but the [current Makefile I'm using for this site can always be found on github](https://github.com/chrisman/chrismanbrown.gitlab.io/blob/master/Makefile).)

Other parts I didn't go over are these:

- magic variables / "macros"
    - `$@`: the target
    - `@<`: the first dependency
    - `@^`: (not shown here) ALL dependencies
- assignment
    - `=`: lazy assignment
    - `:=`: immediate assignment
- pattern matching and substitution
    - `%`: wildcard. as opposed to `*`, like the rest of the civilized world uses
    - `patsubst`: a function that takes a from pattern, a to pattern, and things to do that pattern substitution on.
    - other macros like `shell` and `wildcard`

Anyway, that's my first experience making any kind of a makefile. It's not fantastic. It's not easy, but it is simple. And it's ubiquitous and transferable.

And now in the meantime I can `make index` to create the index page, or `make posts` to create posts, or just `make` to make anything and everything that needs making.


## Conclusion

So there. I wrote a makefile.

I still have some TODOs and some nitpicks. For example:

1. I don't have a great way at the moment, because of my github workflow, to incorporate deployment into my makefile the way I could if I was just `scp`ing these files to a remote server.

2. I'd also like to figure out a way to not have to have `index` and `posts` be separate targets. That'd mean either learning how to manage subdirectories better in make (complete with relative paths for things that need them, like the stylesheets), or basically removing all directory structure and just dumping everything into one root folder. That'd make building files super simple, but it would also result in a messy, untidy pile of files, which is not something I find delightful.


## Resources

1. Links
2. Glossary

### Links

- <https://bost.ocks.org/mike/make/>
- <https://www.olioapps.com/blog/the-lost-art-of-the-makefile/>
- <https://blog.mindlessness.life/2019/11/17/the-language-agnostic-all-purpose-incredible-makefile.html>
- <https://jblevins.org/log/markdown-makefiles>

### Glossary

Make
:   Often refers to GNU Make. An ancient, language agnostic build tool which defines tasks, dependencies, and recipes. Used by C/C++ hackers of old. Not a *great* tool, but an extremely useful one, and installed everywhere, much like vim. An example of the worse-is-better?

Pandoc
:   Converts documents from one format/markup to another. Supports a large variety of formats: <a href="https://pandoc.org/">pandoc.org</a>

changequote`'dnl change quotes `back to default'
include(src/footer.html)
