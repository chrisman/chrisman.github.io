dnl -*- html -*-
define(__timestamp, 2020-06-16)dnl
define(__title, `zsh suffix alias')dnl
define(__keywords, `zsh')dnl
define(__id, 8)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

zsh suffix aliases are a quirky little hack that allow you to define an alias for a file extension.

For example, if you would to just type the name of a `.js` file and open it in vim instead of laboriously typing out `vim filename.js`, you can pop this into your `zshrc` file:

```
alias -s js=vim
```

Cute. I have it in my config. I rarely use it.

Another use case that I think is legit is bulking up media types as ~smhmd suggested on HN:

```
alias -s {ape,avi,flv,m4a,mkv,mov,mp3,mp4,mpeg,mpg,ogg,ogm,wav,webm}=mpv
```

But it's this comment by ~rgrau that really rolls my socks:


> suffix aliases do not even have to refer to a real existing file. They are an alias. That's what I use to clone git repos I copypaste:
>
> alias -s git="git clone"

This one is cool, and I actually do use it a lot. Just copy and pasting a git repo URL into the terminal clones it.

HN thread: <https://news.ycombinator.com/item?id=23309310>

changequote`'dnl change quotes `back to default'
include(src/footer.html)
