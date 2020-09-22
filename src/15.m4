define(__timestamp, 2020-09-21)dnl
define(__title, `how to use slack')dnl
define(__subtitle, `a practical guide to communicating effectively on slack')dnl
define(__keywords, `')dnl
define(__id, 15)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Contents

1. [Introduction](#introduction)
1. [Public By Default](#public-by-default)
2. [Channels Are Free](#channels-are-free)
3. [Use Emoji](#use-emoji)
4. [Use Threads](#use-threads)
5. [Keep the Noise Down](#keep-the-noise-down)
6. [Conclusion](#conclusion)

## Introduction

Following are a couple of things that I think are mostly absent from most *How to use Slack* guides, and also from company handbooks, where company handbooks even cover something like online communication at this level of detail.

Some of these concepts are derived from the way Slack uses Slack internally, as described to me at this one meetup I went to at Slack HQ this one time. Others are derived from my personal experiences and preferences.

## Public By Default

> Create visibility and transparency.

At the center of this argument is the core belief that information wants to be free. Conversations should be public by default.

If it's work related, it shouldn't be in direct messages or group messages or private channels.

Just asking somebody a quick question? Yeah, put it in a project channel. That way the answer is documented somewhere public. If somebody later has the same question, they can search slack for it.

If you are a human who restricts all questions to private channels, then you are contributing to a culture where asking questions is frowned upon. If you want people to feel comfortable and welcomed during onboading, and if you want them to feel empowered to ask questions of their own, you must ask questions yourself in public.

For the same reason, channels should be public by default.

## Channels Are Free

> Create more context.

It doesn't cost anything to create a new channel. As long as it makes sense to do so, you should be making channels for just about any new context. (And they should be public by default.)

Individual projects can include separate channels for #proj-dev, #proj-design, #proj-bots (CI integrations, etc), #proj-general, etc. Focused contexts make it easier to find information later, and they make people feel confident that they're asking questions in the right place.

Also, make ephemeral channels. Make a channel just for the presentation you're working on, and invite your 3 teammates to it. Make one for the conference that your team is going to so there's a dedicated place for chatter and conference resources. You can archive these later. They cost nothing. Channels are free.

With a great proliferation of channels, you may eventually need a channel naming strategy. I don't have any one-size-fits-all suggestions for that. You'll have to figure out what works best for your project / organization.

Aside: if this article was a practical guide to *documenting* things effectively on Slack, this is where I would instruct the reader when creating / maintaining a Slack channel to make prodigious use of the about fields (info, description) and the pinned items. They will give a newcomer a good idea about whether or not they're in the right place.

## Use Emoji

> Create extra, at-a-glance meaning.

Come up with an emoji guide. You can them as a prefix / affix when writing a post, or as a meaningful reaction to somebody else's post.

Some examples that I like to use:

- 🧵 Reply in thread please.
- 👍 I acknowledge that I have read this
- 👀 I have my eyes on this. I'm working on it.
- ✅ I'm done working on it. This has been fixed.
- 🙏 Thank you.
- 🚨 Off topic. Not the right place for this.

Aside: for an additional place to use emoji as signifiers, check out [Commit Message Emoji](https://github.com/dannyfritz/commit-message-emoji).

## Use Threads

> Create structured conversations.

You know how you can scan a book's table of contents and get a pretty good idea of what it's about, and then drill down for more details?

Same goes for a well organized paper or article, and the same goes for your slack channel if everybody uses thread.

Using threads allows one, with a quick glance, to get an idea of the *structure* and the *content* of the conversation. At which point one can quickly and easily prioritize which parts of the conversation to dip into first, which parts can be skimmed, which parts need careful reading, and which parts can be put off until later.

Aside: The lack of threads is one of the biggest anti-features of Discord, and is why so many Discord servers go absolutely wild with the idea of *Channels Are Free*. The channels *become* threads and are hyper-specific and numerous.

## Keep the Noise Down

> Create space for people to be productive and efficient.

Isolate conversations to their appropriate channels.

Use threads.

Follow the principle of [No Hello](https://www.nohello.com/), and then expand it to "No OK" and "No Thanks". Use emoji for those. (Use 👍 for OK, and 🙏 for thanks.)

Similarly, don't ask if you can ask. This includes asking things like, "Any &lt;topic&gt; experts in here?" This is inconsiderate. Because you haven't just asked your question, nobody knows the context or the expertise level required to answer your question. Just ask the question. Either somebody will help you, or they won't, or they will direct you to a better resource.

## Conclusion

There, now you know how to use Slack. You're welcome.

changequote`'dnl change quotes `back to default'
include(src/footer.html)
