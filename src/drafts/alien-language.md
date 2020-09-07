title: alien alphabet
subtitle: my favorite technical interview question

1. Introduction
2. Setup
1. Part 1: The Puzzle
1. Part 2: The Algorithm
2. Part 3: The Data Structure
3. Conclusion

## Introduction

I was recently asked a question as part of a technical interview that I thought was really unique and interesting, and also really fun.

It had three distinct parts. The first was a puzzle in which you determine the order of the alphabet. The second part focused on creating an algorithm for solving the puzzle. And the third and final part required modeling the data with an appropriate data structure.

By the end, using this single problem, the interviewer gets a sense of the interviewee's ability to problem solve and think logically, their familiarity with algorithms and data structures, and of course their ability to communicate and describe their thought process.

## Setup

The setup was very simple. They introduced the basic concept: there is an alien alphabet made up of letters, which can be assembled into words, and the words can be sorted into alphabetical order.

My interviewer had taken a picture of a page from their notebook in which they had hand drawn a couple lines of symbols. Circles, trianges, squares, and stars.

They shared their screen and had the page loaded up in Preview.app. They at times made use of the annotation tools to scribble notes and examples in the margins.

## Part 1. The Puzzle

The puzzle looked like this:

```
!##
#!$@
#!$#
$#!
$#@
```

You can substitute simple shapes or emoji or whatever for the symbols.

You are to assume that this list of 'words' is already in alphabetical order.

The task is to determine the alphabet.

<details>

<summary>solution</summary>

It should be pretty trivial to arrive at the correct solution: `!@#$`.

You can discover a couple of rules by looking solely at the first letter of each word:

1. bang < hash
2. hash < bling

And the additional rules can be discovered by comparing the differing digits in words 2 and 3, and words 4 and 5:

3. at < hash
4. bang < at

So, bang at hash bling.

</details>

## Part 2. The Algorithm

Iterate through the word list, comparing each word to the next.

The way you compare the words is to iterate through the characters of each word until you find any characters that are not the same, or until you run out of characters in the first word.

examples:

```
!##
#!$@
#!$#
$#!
$#@
```

1. Compare the first two words, `!##` and `#!$@`.
    1. The first two characters are different. Stop here. `! < #`
2. Compare the second two words, `#!$@` and `#!$#`
    1. The first two characters, `#` and `#`, are the same. Proceed.
    1. The second two characters, `!` and `!`, are the same. Proceed.
    1. The next two characters, `$` and `$`, are the same. Proceed.
    1. The next two characters, `@` and `#`, are different. Stop here. `@ < #`.
3. Compare the next two words, `#!$#` and `$#!`
    1. The first two characters, `#` and `$`, are different. Stop here. `# < $`.
3. Compare the next two words, `$#!` and `$#@`
    1. The first two characters, `$` and `$`, are the same. Proceed.
    1. The next two characters, `#` and `#`, are the same. Proceed.
    1. The next two characters, `!` and `@`, are different. Stop here. `! < @`.

Not represented is something like comparing `#!` and `#!$$@`. An equivelant in english would be 'bad' and 'badger'. 'Bad' comes before 'badger' because their characters are all equal right up until 'bad' runs out of letters. Hence, the algorithm says to compare characters until you find any characters that are not the same, *or until you run out of characters in the first word.*

So now your algorithm has produced all the rules you need:

1. `! < #`
2. `@ < #`
3. `# < $`
4. `! < @`

And now, if you're like me, you may have noticed that this puzzle is all logic, and you may be wondering whether you could learn prolog real quick to create puzzle solver for this problem.

## Part 3. The Data Structure

So the next part is representing the data appropriately.

The first thing I tought of trying was some kind of tree in which left and right branches represented order. I still think this could work, but it quickly became complicated because of constantly needing to rebalance the tree.

My interviewer artfully guided me by asking, "What data structure is a tree a subset of?"

And so we explored the option of a directed graph.

```
digraph {
  "!" -> "#"
  "@" -> "#"
  "#" -> "$"
  "!" -> "@"
}
```

![alien alphabet graph](/img/alien-alphabet-graph.png)

This very nicely represents our alphabet and all the rules we have discovered about it. 

To print out your alphabet, in order, you simply traverse through the graph in a way that visits each node once.

The graph will also quickly let you know whether there are problems or errors with your data. For example, the existance of a loop in your graph means that the problem is unsolveable.

## Conclusion

Before continuing, I'll pause here to say that this problem was, appropriately, but a small part of a larger technical screening process. It came after having completed a "take home" challenge. So there was already context and evidence of my technical skill. This problem served to provide further insight into one's thought process and one's grasp of fundamental problem solving skills.

I thought this was a very fun little exercise that ended up being more complex than it initially appeared.

Solving the initial puzzle by hand was just fun and entertaining.

Having to back up and explain the discreet steps for a computer to solve the problem was required some deeper thought.

And finally thinking about how best to represent the data allowed me to demonstate my knowledge of data structures.

This single exercise managed to easily encapsulate all of the different parts of how a software developer might engineer a solution to a problem. You have to understand the problem and be able to describe it, you need to be able to thoughtfully create an algorithm to solve the problem, and you finally need to be able to come up with a data structure that complements your algorithm.

I will definitely use this question myself when conducting technical interviews in the future.
