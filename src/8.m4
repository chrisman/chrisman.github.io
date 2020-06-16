dnl -*- html -*-
define(__timestamp, 2020-06-16)dnl
define(__title, `zsh suffix alias')dnl
define(__keywords, `zsh')dnl
define(__id, 8) define(__last) dnl
include(src/header.html)
<p>zsh suffix aliases are a quirky little hack that allow you to define an alias for a file extension.</p>
<p>For example, if you would to just type the name of a <code>.js</code> file and open it in vim instead of laboriously typing out <code>vim filename.js</code>, you can pop this into your <code>zshrc</code> file:</p>
<pre><code>alias -s js=vim</code></pre>
<p>Cute. I have it in my config. I rarely use it.</p>
<p>Another use case that I think is legit is bulking up media types as ~smhmd suggested on HN:</p>
<pre><code>alias -s {ape,avi,flv,m4a,mkv,mov,mp3,mp4,mpeg,mpg,ogg,ogm,wav,webm}=mpv</code></pre>
<p>But it’s this comment by ~rgrau that really rolls my socks:</p>
<blockquote>
<p>suffix aliases do not even have to refer to a real existing file. They are an alias. That’s what I use to clone git repos I copypaste:</p>
<p>alias -s git=“git clone”</p>
</blockquote>
<p>This one is cool, and I actually do use it a lot. Just copy and pasting a git repo URL into the terminal clones it.</p>
<p>HN thread: https://news.ycombinator.com/item?id=23309310</p>
include(src/footer.html)
