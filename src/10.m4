define(__timestamp, 2020-06-23)dnl
define(__title, `setting up python on macos')dnl
define(__subtitle, `a newcomers guide')dnl
define(__keywords, `python')dnl
define(__id, 10)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4


## Contents

1. Relevant xkcd
2. Background
3. Don't use python
4. Don't use python
5. Conclusions
6. Resources
7. Glossary

## Relevant xkcd

[relevant xkcd](https://xkcd.com/1987/)

## Background

I think I like Python. I like the idea of it. I like that other people like it.

My primary experience with it was working through [Automate The Boring Stuff](https://automatetheboringstuff.com/), which I found delightful.

I've never been able, since then, to *do* anything with it though.

My friend ~troido wrote the client for [a cute game he's making](https://github.com/jmdejong/asciifarm-client) in python, and I wanted to help work on it with him, but with the attention span of a goldfish, I wasn't able to get the client up and running within 40 minutes, so I resolved to "come back to it later," and walked away.

I've also been watching with idle curiosity as the popularity of web frameworks like Flask and Django continue to hold strong, and maybe even grow in popularity.

In fact, it was just this morning that I attempted to work through a Flask tutorial and create a little web server. For fun and profit.

To my great dismay, I was once again immediately unproductive.

My python was out of date, pip wouldn't install stuff, and I simply couldn't Get Stuff Done.

So I dug in, and here's what I learned:

1. Don't use python

2. Don't use python

## Don't use python

That is, don't use the system installed python. And don't even try to install the latest version of python3 from homebrew.

Instead, install a python environment manager:

```
brew install pyenv
```

This makes sense to me. Much like `renv` manages different installed versions of ruby and `nvm` manages installed versions of node.

The chief difference though is that I can at least use the installed versions of ruby and node to *do stuff* without hassle. The version managers are only required as complexity increases, after you suddenly have multiple projects, each requiring a different version of the language. I've never seen a situation where you need to install an environment manager just to get started. Just to fix the broken environment that comes installed on the computer.

Installing a new version of python:

```
pyenv install 3.7.7 && pyenv global 3.7.7
```

And added this to the end of my zshrc:

```
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
```

Also this, because "thon" is too much to be bothered with:

```
alias py=python
```

A quick `source ~/.zshrc` to reload my shell, and there we go:

```
> pyenv versions
  system
* 3.7.7 (set by /Users/me/.pyenv/version)

> python -V
Python 3.7.7

> which python
/Users/me/.pyenv/shims/python

> pip -V
pip 19.2.3 from /Users/me/.pyenv/versions/3.7.7/lib/python3.7/site-packages/pip (python 3.7)

> which pip
/Users/me/.pyenv/shims/pip
```

So now I have a sane and modern install of python that seems to work in a safe, managed environment. No messing with the system install and breaking stuff. No symlinking to where ever it is homebrew installs stuff now.

Now I'm ready to write a Flask server.

Except I learned my second lesson.

## Don't use python

That is, don't go installing stuff from your project directory all willy-nilly.

Turns out python doesn't really have a concept of installing anything locally to a project directory. Everything is installed globally, or "local globally" for the user.

So python makes use of what it calls virtual environments to sandbox its project dependencies.

First, optionally it's probably a good idea to document / enforce which version of python you're using.

```
pyenv local 3.7.7
```

This creates a `.python-version` file with the version number in it.

Then you can create the virtual environment sandbox:

```
python -m venv venv
```

This creates a `venv` directory.

Now it's time to play in the sandbox:

```
source venv/bin/activate
(venv) which python
/path/to/my/dir/venv/bin/python
```

To exit the sandbox, `deactivate`.

## Conclusions

I totally understand having to set up your working environment before getting started. But it seems like python and macos have worked together to make a really spectacularly crappy onboarding experience.

1. Macs ship with an old major version of python. Messing with it breaks stuff.

2. Macs don't have a software package manager to allow you to upgrade stuff.

3. The unofficial package manager, homebrew, can't upgrade python for you. It can only do a parallel install, which requires constant linking and fussing to see whether you're using the correct python and the correct pip.

4. Python's `venv` seems to address a design flaw in the language. Or in `pip`. Why is there no way to install local packages by default? At least, that's my opinion after having used python for 5 minutes.

Anyway. I'm going to go try to write a Flask server now.

## Resources

- <https://opensource.com/article/20/4/pyenv>

## Glossary

Python
: A British surreal comedy troupe known for its use of significant whitespace, founded by John Cleese, Eric Idle, and Guido van Rossum. Like the snake, ought not be used directly.

Pip
: Python's package installer. Short for "Pip pip! Cheerio, old chap! What ho, old bean!"

changequote`'dnl change quotes `back to default'
include(src/footer.html)

