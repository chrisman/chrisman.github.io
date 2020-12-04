define(__timestamp, 2020-12-03)dnl
define(__title, `Pouring water into cups')dnl
define(__subtitle, `An example of how to solve a problem')dnl
define(__keywords, `')dnl
define(__id, 17)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Contents

1. [In Theory: How To Solve A Problem](#in-theory-how-to-solve-a-problem)
2. [In Practice: Pouring Water Into Cups](#in-practice-pouring-water-into-cups)
3. [Looking back](#looking-back)
4. [Conclusion](#conclusion)

## In Theory: How To Solve A Problem

So I did a lot of job interviews this summer. Thanks Covid!

I enjoy interviewing for a lot of reasons, primarily because I get a chance to talk about some of my most favorite things. Namely myself, principles of software design, and critical thinking.

The critical thinking question often comes in the form of a coding challenge and is often presented along with a phrase something like, "We just want to see how you think, how you solve problems." This is an okay thing to do. At least, I think that it makes sense as long as you believe that by using this format you are--like a knight on a chess board--applying pressure to two points at the same time:

1. Is this person capable of critical thinking, and

2. Is this person proficient in this particular code environment?

But it is probably best not to pursue the nested metaphor of job interview as battlefield.

Furthermore, the problem with combining those two questions is conflating that which is quickly learnable from duckduckgo (language syntax, etc) with that which is not (the ability to think and solve problems). It conflates knowledge and intelligence.

Which is not to say that you cannot learn critical thinking or problem solving. You definitely can! It's just not a fact that you can quickly look up. It's a skill, the development of which requires application and practice.

One of the best resources on this topic for programmers and other humans is *How To Solve It*, by G. Polya, a short little book about mathematical proofs published in 1945. It approaches the topic of problem solving from the view of a student who is presented with what is for them an unsolvable problem. They don't know where to begin, or how. Polya presents a deceptively simple plan, and then several methods for executing that plan to get the student un-stuck.

The plan is this:

1. Understand the problem
2. Devise a plan
3. Carry out the plan
4. Look back at the completed solution

That's it.

Here are just a couple of the questions that Polya poses to guide the student through understanding the problem and devising a plan:

- Do you know a related problem?

- Look at the unknown! And try to think of a familiar problem having the same or a similar unknown.

- Here is a problem related to yours and solved before. Could you use it?

- Could you restate the problem?

- If you cannot solve the proposed problem try to solve first some related problem.

- Did you use all the data? Did you use the whole condition?

I think about this book a lot, but it's kind of hard for me to talk about because, I think, it remains kind of theoretical. At least, people seem to not look very satisfied when they ask me about my approach to problem solving and I tell them about my four step approach, and describe a couple example heuristics.

Which brings me back around again to the notion that you probably have to combine talking about ones approach to problem solving with some kind of practical demonstration. But I remain unconvinced that a coding challenge is the best possible format for that, because they remain in my mind two separate domains.

## In Practice: Pouring Water Into Cups

Anyway, let's pour some water into some cups.

Imagine you have two cups, a tall one and a short one, with no markings or measurements on them. The first holds exactly 9 liters, and the second exactly 4. Given an infinite water source, how can you measure out exactly 6 liters using just your two cups?

How would you start?

It is best to begin not by thinking about the problem directly, but by thinking about how to think about the problem.

Start with the obvious: What is the unknown?

By asking that simplest of questions, you might notice that the distinguishing feature of this puzzle is that the final state is given to you. You know that at the end, you will have 6 liters. That is not the unknown. 

The unknown is the process by which we will arrive at the final state.

Again, super obvious. But it's good practice to describe the shape and the nature of the problem before just diving straight in.

What makes this puzzle challenging is the unexamined tendency of most of us to do just that: to dive right in and work the problem forward. But here, we know the outcome already, so this is likely an ideal opportunity to apply the tactic of Working Backwards. Which, yes, is one of Polya's heuristics.

> Let us start from what is required and assume what is sought as already found, says Pappus.

Starting from what is required:

We have solved the puzzle, and have 6 liters of water. (It must be in the 9 liter cup because the 4 liter cup cannot hold 6 liters.) Given what we know, in what ways is it possible to arrive at this state?

1. We could fill up the 9 liters and pour off 3 liters.

2. Or we could fill up the 4 liter cup and pour it into a 9 liter cup which is already somehow holding 2 liters.

Let's pull at the first thread.

3 liters is a new quantity, something we didn't have before. By what process could we possibly know how to pour off exactly 3 liters from the 9 liter cup? The question suggests the existence of 1 liter already being in the 4 liter cup, so that filling it up to the top would require 3 liters.

So here it is, we have some new data to play around with. We know we can arrive at the 6 liter solution if only we could figure out how to arrive at 1 liter.

Where does 1 liter exist in our existing quantities?

This next step takes a bit of an intuitive leap. Or else it requires a period of *messing around* with the cups until you happen to create a pattern that you recognize. Because it's hard to know things you've never seen before. (The student's ability to draw on things they've seen before is one of the core themes of Polya's heuristics: Have you seen an analogous problem? Do you remember solving a similar problem before?)

The linchpin is that `9 = 4 + 4 + 1`. There's our hidden 1. Pull at this and the whole thing comes toppling down.

We'll unreverse our process now and start from the beginning:

- Start with a full 9 liters. Pour it into the 4 liter cup.

- Now you have 5 and 4. (This might be the first pattern that allows you to intuit the existence of a 1 liter quantity while messing around with the cups.)

- Empty the 4 liter cup (5 and 0), and fill it up a second time from the first cup.

- Now you have 1 and 4. Now the cards will all come down.

- Empty out the 4 liter cup: 1 and 0.

- Transfer the 1 liter from the first cup to the second cup: 0 and 1

- Fill up the first cup to the top: 9 and 1.

- Pour from the first cup into the second cup, filling it up.

Now you have 6 liters in the first cup and you have solved the puzzle.

## Looking back

We solved the problem by following Polya's steps:

1. We understood the problem in terms of its inputs, and what was being asked. And we determined the shape of the problem by noticing we were given the answer.

2. We devised a plan based on that information, and decided to try working backwards from that solution.

3. We carried out the plan!

And now we look back and reflect. We used all the data and arrived at the condition we wanted to.

We did leave an unexplored branch though. At the beginning, we decided to try to pour 3 liters out of the tall cup instead of pouring 4 liters *into* the tall cup.

A problem solver may or may not want to go back and continue working the problem from other angles. Depends on what is most important: is it arriving at the solution? Or is it that the problem be worked as thoroughly as possible? I probably wouldn't have even thought about the question had we not paused and completed this fourth and final step.

## Conclusion

I work hard at developing my problem solving skills to compensate for the fact that my innate stress response is to freeze (as opposed to fight or flight). This is manifest in me freezing or feeling stuck when faced with a challenging problem, be it in my professional or personal life. Unchecked, it can lead to procrastination and putting off things that seem difficult. So it helps me to be very deliberate and methodical in my approach to these things, to have a framework and to know that every problem is at least approachable if not solvable. And the unsolvable problems feel less intimidating, less like a failure, if I know I've tried all of the tools in my toolbox on them.

Developing this skill has additonal benefit that now most challenges and problems have an element of fun for me. Because it's fun to do something you know you're skilled at.

changequote`'dnl change quotes `back to default'
include(src/footer.html)
