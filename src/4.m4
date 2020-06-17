dnl -*- html -*-
define(__timestamp, 2020-01-28)dnl
define(__title, `Reducing Complexity')dnl
define(__subtitle, `the most worthwhile pursuit')dnl
define(__keywords, `design, philosophy, complexity')dnl
define(__id, 4)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4
I'm working on a theory that most worthwhile endeavors are attempts to reduce
complexity in our lives.

## Complexity in Software

> Complexity is anything related to the structure of a software system that
> makes it hard to understand and modify the system.

*[A Philosophy of Software Design][aposd]* is a sort of anti-complexity
manifesto.  In it, the author builds his entire world view, as it pertains to
designing software systems, on the following tenants:

1. The fundamental exercise of software design is breaking large problems down
   into smaller problems.

2. As systems grow, they gain complexity because they gain dependencies and
   obscurity.

3. Complexity can be reduced through careful design. Careful design includes
   hiding complexity behind simple interfaces, thoughtful documentation,
   correct abstractions, etc.

One of the more remarkable parts of the book to me was when, in one of the
later chapters, the author briefly discusses a short list of "recent trends" in
software development such as agile, TDD, and design patterns<sup>1</sup>. When
discussing them, he analyzed each topic by applying his world view of
"Simplicity is the most important thing," and was thus able to evaluate their
worth based on how much complexity they added or reduced in the system. As
such, he was kind of okay with design patterns, sort of okay with agile (units
of development, he argues, should be *abstractions* not *features*) and not
that big a fan of TDD.

I found this part interesting because of how this notion of simplicity--or at
least that of anti-complexity--allowed the author to, in black and white, critique
and analyze entire practices and processes of development and design and
decide whether they were good or bad. For definitions, that is, of good and
bad as they map to simple and complex.

[aposd]: https://www.goodreads.com/book/show/39996759-a-philosophy-of-software-design


## Complexity is Universal

In [Reality has a surprising amount of detail][rhasaod] ([HN]), John Salvatier
demonstrates how neither breaking big problems down into smaller problems nor
reducing complexity are by any means unique to software design when he
describes the inherint complexity in things as seemingly simple as building
basement stairs, or even boiling a pot of water.

Software is a new field, as such things go. People have been decomposing
problems, and creating abstractions and models for millenia.

There is no reason to think that we who write software are special or unique
for valuing or creating simplicity, nor to think that we are even really any
good at it. At least, not any better than the carpenter or the stone mason.

[rhasaod]: http://johnsalvatier.org/blog/2017/reality-has-a-surprising-amount-of-detail
[hn]: https://news.ycombinator.com/item?id=16184255


## Complexity of Mind and Body

The things I am valued for--the things that people pay me money to do--are
these:

1. Design and write software
2. Teach yoga

Yoga is a lot of different things. One of the things it is, is a novel *more
simple* way of being in your body and in your mind. Through yoga asana (the
physical form of yoga that most people think of when they think of "yoga") and
through meditation, the practitioner gets to experience and enjoy the
simplicity of a more shallow interface, behind which the complexity of one's
body and one's mind is temporarily hidden.

And so yoga feels good.

It gives you a simple, defined way to interface with and interact with your
body.

It provides you, through meditation, a simple (not easy!) means of engaging
with your mind. A set of tools with which you can create a sort of abstraction
for the complexity of your mind.

Yoga is a great sort of API for your mind and body.


## Complexity of Abstract Thought

Yoga teachers are fond of framing just about everything in the context of yoga,
which is something you can easily do when you believe that yoga effects most
ascpects of existing: your physical self, breathing, focus and thinking, even
ethics and morality if you're into the yamas and the niyamas.

And so if pressed on the matter, most yoga teachers will readily agree,
"Yeah, pretty much everything is yoga."

And so, a colleague of mine who is also both a software engineer and a yoga
teacher were talking one afternoon about how "everything is yoga," and I
decided to introduce to him what was then a blossoming Anti-Complexity Unified
Theory, and I said to him, "Yes, and I think everything also might be software
design."

And I proceeded to tell him about simplicity and how I'm coming to think that
maybe most things we do are attempts to reduce or at least hide complexity
through the design of simple interfaces and APIs.

He argued, "Well, some things, perhaps, but not all things. Not things like
creativity."

But I think that "creativity" may be one of the ultimate attempts at reducing
complexity: the distillation and expression of an abstract thought or feeling
in a novel way is most certainly the act of creating a sort of more simple
interface for whatever feeling or emotion the artist is trying to capture and
convey.

It's why we create metaphor and fiction: abstractions that represent a
complex idea or concept that we don't have a single word or simple term for.

"Well, perhaps. But not things like friendship."


## Complexity of Humans

I'm not sure about that one either. Humans are improbably complex creatures.
Wholly irrational and unpredictable. Totally unknowable. Nobody would design
such a system; it simply wouldn't be allowed. Impossible to QA, for one thing.

When I think of strong friendships I've been fortunate to have, I think of how
reliable and predictable those relationships are. I think of how I know how to
talk to my friends about what topics, and how easy those conversations and
relationships are.

We have essentially, my friend and I, created simple interfaces behind which we
can hide the complexity of who we are, of being human. That complexity is still
there, of course. But is for the most part abstracted away. With my friends,
I'm reasonably confident that I can interact with this most complex system, I
can exchange information with it in the form of conversations and experiences
and feelings, and it won't generate any "errors." Or if so, hopefully not any
fatal ones.

I wouldn't walk up to a stranger and start talking in a vulnerable way about my
feelings and thoughts, because their API is undocumented and I haven't explored
it.

So I don't know. Maybe friendship is a sort of API or interface design.


## Conclusion

There's no big conclusion here. This is just an idea I'm kicking around:
simplicity as a world view. The value of creating predictable, reliable systems
by designing interfaces that hide complexity. In all areas of life.

It's why we create abstractions. Our brains are wired for it. It's why a lot of
art works. It's why we can look at a colon and a closing parenthesis and think
it looks like a smiley face :)

## Footnotes

<sup>1</sup> Amusing to see these called "trends"! Okay, maybe TDD is a trend.
And maybe agile, too. But *design patterns?* That's almost like saying Object
Oriented Programming is a trend! Which I suppose one could actually argue..

I guess I'm still pretty new here, because these are just "the way things are
done." If the rise and fall of trends over the history of the profession of
software development form a curve, then the span of my entire career must be
short enough to basically be the derivative of that curve at a single point.

What a dose of perspective.

## Further Reading

- Simple Made Easy, Rich Hickey: https://www.infoq.com/presentations/Simple-Made-Easy/

## Glossary

Yoga
:   A useful interface for accessing one's mind and body 

changequote`'dnl change quotes `back to default'
include(src/footer.html)
