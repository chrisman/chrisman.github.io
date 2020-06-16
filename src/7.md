---
title: Racism and Oppressive Language in Software Development
subtitle: small ways to be anti-racist
author: chrisman
date: 2020-06-12
keywords: racism
...

There is a lot of metaphor embedded in software development. Julia Evans recently did a really interesting analysis of metaphor in man pages in [*Metaphors in Man Pages*][1].

Another pervasive metaphor that exists in software development is that of white supremacy.

You can see examples of the "Black is Bad" effect when we talk about blacklisting and whitelisting. Or about black hat and white hat hackers.

One surprisingly common convention in hardware and software is to describe things as having a "master / slave" relationship.

In a memo titled [*Terminology, Power and Oppressive Language*][2] The <abbr title="Internet Engineering Task Force">IETF</abbr> makes several recommendations for alternatives such as replacing blacklist and whitelist with blocklist and allowlist. This is anti-racist, and also has the additional benefit of being more clear, precise, and descriptive by saying what it actually is instead of relying on racism to convey meaning.

They also recommend several alternatives to master/slave such as primary/secondary.

[Master/slave terminology is hardcoded into git][3]. Git by default initializes a project with a "master" branch.

Eliminating racist language from the platform is possible. [Python did it][4]. Until that happens though, what you and I can do right now is to configure git locally to initialize with a primary branch called something--anything, really--besides master.

You can do this with [git template directories][5], which contain everything you want copied into a `.git` directory upon initialization. Including the `HEAD` file, which contains a reference to the name of the primary branch.

So I did it.

I created a template directory, and [updated my gitconfig][6] to use it.

Now every time I run `git init` I start with a "main" branch.

Because we should be dismantling racism when ever and where ever we encounter it.

You can use <https://github.com/chrisman/kill-your-masters> to get started yourself.

Kill your masters.


[1]: https://jvns.ca/blog/2020/05/08/metaphors-in-man-pages/
[2]: https://tools.ietf.org/id/draft-knodel-terminology-00.html
[3]: https://github.com/git/git/blob/master/builtin/init-db.c#L268
[4]: https://www.vice.com/en_us/article/8x7akv/masterslave-terminology-was-removed-from-python-programming-language
[5]: https://git-scm.com/docs/git-init#_template_directory
[6]: https://github.com/chrisman/dotfiles/commit/ab92f5b8928869ca24d8a459ba612f3839960403
