dnl -*- html -*-
define(__timestamp, 2020-06-12)dnl
define(__title, `Racism and Oppressive Language in Software Development')dnl
define(__subtitle, `small ways to be anti-racist')dnl
define(__keywords, `racism')dnl
define(__id, 7)dnl
include(src/header.html)
<p>There is a lot of metaphor embedded in software development. Julia Evans recently did a really interesting analysis of metaphor in man pages in <a href="https://jvns.ca/blog/2020/05/08/metaphors-in-man-pages/"><em>Metaphors in Man Pages</em></a>.</p>
<p>Another pervasive metaphor that exists in software development is that of white supremacy.</p>
<p>You can see examples of the “Black is Bad” effect when we talk about blacklisting and whitelisting. Or about black hat and white hat hackers.</p>
<p>One surprisingly common convention in hardware and software is to describe things as having a “master / slave” relationship.</p>
<p>In a memo titled <a href="https://tools.ietf.org/id/draft-knodel-terminology-00.html"><em>Terminology, Power and Oppressive Language</em></a> The <abbr title="Internet Engineering Task Force">IETF</abbr> makes several recommendations for alternatives such as replacing blacklist and whitelist with blocklist and allowlist. This is anti-racist, and also has the additional benefit of being more clear, precise, and descriptive by saying what it actually is instead of relying on racism to convey meaning.</p>
<p>They also recommend several alternatives to master/slave such as primary/secondary.</p>
<p><a href="https://github.com/git/git/blob/master/builtin/init-db.c#L268">Master/slave terminology is hardcoded into git</a>. Git by default initializes a project with a “master” branch.</p>
<p>Eliminating racist language from the platform is possible. <a href="https://www.vice.com/en_us/article/8x7akv/masterslave-terminology-was-removed-from-python-programming-language">Python did it</a>. Until that happens though, what you and I can do right now is to configure git locally to initialize with a primary branch called something–anything, really–besides master.</p>
<p>You can do this with <a href="https://git-scm.com/docs/git-init#_template_directory">git template directories</a>, which contain everything you want copied into a <code>.git</code> directory upon initialization. Including the <code>HEAD</code> file, which contains a reference to the name of the primary branch.</p>
<p>So I did it.</p>
<p>I created a template directory, and <a href="https://github.com/chrisman/dotfiles/commit/ab92f5b8928869ca24d8a459ba612f3839960403">updated my gitconfig</a> to use it.</p>
<p>Now every time I run <code>git init</code> I start with a “main” branch.</p>
<p>Because we should be dismantling racism when ever and where ever we encounter it.</p>
<p>You can use <a href="https://github.com/chrisman/kill-your-masters" class="uri">https://github.com/chrisman/kill-your-masters</a> to get started yourself.</p>
<p>Kill your masters.</p>
include(src/footer.html)
