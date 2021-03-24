define(__timestamp, 2021-03-24)dnl
define(__title, `expressions with line numbers in vim')dnl
define(__subtitle, `Some more vim tomfoolery')dnl
define(__keywords, `')dnl
define(__id, 20)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

I was doing some sweeping structural changes across many files. I had already fine-tuned the macro I needed in order to change a single line. I just needed to be able to apply that change to every line within a certain block. Say, between two square brackets:

```javascript
"fruits": [
    "apple",
    "orange",
    "banana",
    "pear"
]
```

I needed it to look something like this at the end:


```javascript
"fruits": [
  {
    "name": "apple",
    "color": "red",
    "children": []
  },
  {
    ...
  },
  {
    "name": "pear"
    "color": "red",
    "children": []
  }
]
```

Simple enough.

My first thought was to visually select everything in the brackets and run the macro on them in normal mode: `vi[:norm @q`.

But that didn't work. Something about the execution of the macro in that way had the objects being expanded and pasted inside each other all willy-nilly, and I ended up with nested heaps of garbage nonsense instead of nice neatly stacked piles of fruit.

So what I tried next is probably insane, but I remembered that you can use marks in a range, and you can get line numbers from the expression register. So what I did was write a new macro that does this:

1. Find the next instance of `"fruits": [`: `/"fruits": \[`
2. Go down a line and set a mark "t" (for top): `jmt`
3. Go up, find the `[` again, jump to its closing bracket, and set a mark "b" (for bottom): `kf[%mb`
4. Now the foolishness. Make a new line to act as a scratchpad. `o`. You're already insert mode, so go with that and put the contents of the expression register, evaluating the difference of the line number of the bottom mark minus the line number of the top line number: `^R=line("'b") - line("'t")^M`. That'll put 4. That's how many lines there are between the two brackets. That's how many times you need to run the macro. Sometimes it's 8, sometimes it's 34. There is lots of fruit.
5. Add `@q` after the 4, so the whole line reads `4@q`. Delete that line to a register, like `a`: `"add`
6. Go to the top of the block and `@a`

Repeat as necessary.

I was then able to combine that macro with another one that automatically performed that function for all instances of "fruits", which I was then able to apply over half a dozen files all at once with a `:bufdo`.

I was later able to modify these macros for a use case when I needed to modify an unknown number of four line chunks of text within a block. Almost the exact same flow, but I counted the line numbers and divided by four, and executed the macro that many times.

So yeah, acknowledging that the up front cost to all this was a couple minutes of macro crafting, I turned a manual, hunt and peck, search and replace process into one command.

vim!


changequote`'dnl change quotes `back to default'
include(src/footer.html)
