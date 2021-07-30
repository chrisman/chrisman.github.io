define(__timestamp, 2021-07-05)dnl
define(__title, `Moving from Github')dnl
define(__subtitle, `I want to not be on Github any more')dnl
define(__keywords, `github gitlab')dnl
define(__id, 22)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Introduction

**tldr**: This is the last update I will be making to <https://chrisman.github.io>. Please update your bookmarks and rss readers to <https://chrismanbrown.gitlab.io>.

## What is wrong with Github

Here's a roughly chronological list of all the issues I've had with Github.

1. Github has a weird monopoly on web frontends for git, and on open source software hosting. I think the majority of people think that in some ways Github *is* git, which is like thinking Gmail is email. I've had to use Gitlab and Bitbucket because of work, but for the most part, Github is the *de facto* git hosting option.

2. Github continues to sell its services to ICE over the protests of its employees and many of its users.

3. Github banned Iranian users--some of them paying customers--based on nationality[^1].

[^1] It has been claimed that Github was legally obliged to ban Iranian users to be in compliance with embargos against Iran at the time.

4. I'm very uncomfortable with Microsoft, one of the most monopolistic and anti-competition software companies in history, owning most of the free software in the world through acquiring Github and NPM. Which brings us to...

5. Github Copilot. I don't think I'm likely to be personally effected by Copilot. I have no delusions that *my* code would be useful to the AI. Nonetheless, I care about this very much in the same way that I care about the Bill of Rights. Github fed copyrighted code to their AI, and there is now no way to acknowledge and/or compensate the creators of that code. Acknowledegment and/or compensation that is required by most open source copyrights. Github violated the rights of its users.

## What to do now

I'm going to be going through my github repos and deleting most of them. (Most of my repos are old code school assignments anyway.) I probably only have half a dozen or so repos that are important or useful enough for me to keep.

Most of my sites/blogs are already checked into a private git server anyway.

In a perfect world, I should just self-host everything. 

In an imperfect world full of humans, I'll be moving over to Gitlab in the short turn because they provide static site hosting in a way very similar to github pages.

I can't do anything as dramatic or final as deleting my account, because I still need it for work. And there's also the consideration of "Github profile as resume" to consider. I don't know how much or how often employers really look at github activity when considering hiring a developer, but I don't want to do anything that feels tantamount to, say, deleting my linkedin profile.

changequote`'dnl change quotes `back to default'
include(src/footer.html)
