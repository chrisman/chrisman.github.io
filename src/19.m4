define(__timestamp, 2021-03-21)dnl
define(__title, `Registers')dnl
define(__subtitle, `a vim story')dnl
define(__keywords, `')dnl
define(__id, 19)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

I was recently complaining/bragging about a complex bit of text editing I was doing for a project. The gist of it was converting an OCR rip of a PDF, full of conversion defects and artifacts, into JSON. So, yuck.

Throughout the course of this task, I started collecting lots of little snippets and macros. Currently, of my 26 named vim registers (A-Z), I've reserved `"a` and `"b` for general use, and it looks like `"u` is empty. That's it. The other 23 registers are snippets of JSON or special characters saved for quick insertion (™, ®, ½, etc), or macros for transforming stuff, expanding snippets, and moving stuff around.

This is a quick post about how I use those registers, and also a few other random vim tips that I used during this process.

## Contents

1. [Snippets](#snippets)
2. [Macros](#macros)
3. [Other stuff](#other-stuff)
    - [Working with many files](#working-with-many-files)
    - [Norm](#norm)
    - [Expression in a substitution](#expression-in-a-substitution)
4. [Conclusion](#conclusion)
5. [Appendix](#appendix)
    - [Resources](#resources)
    - [That macro](#that-macro)


## Snippets ##

I have several templates like this that I need to create constantly:

```json
{
  hasImages: true,
  imageUrls: [
    ""
  ],
  noteIds: [
    0
  ]
}
```
So I would yank that to a register by visually selecting it (if your cursor is on a curly bracket, `V%`) and then `"zy`. `"z` = "to register z", `y` = yank. Yank to register `z`.

Then later I could pop it out with `"zp`. (Register z, "put").

I later referred to these "templates" in macros that were basically "perform this text expansion on these lines of code." In this example, the macro would paste that template and then fill in the URLs or the note IDs.

This is of course a perfect use case for a snippet library like ultisnips or coc-snippets. Except I haven't figured out how to expand a snippet yet inside of a macro. So I went with this more manual method of text expansion, and it worked fine. At the cost of a few registers.

## Macros ##

My macros started getting long and complex.

For a long time I could just `:reg` to see all my registers and their contents, and I could eyeball them and kind of remember what did what. But after a while, it started to require more and more effort to tell them all apart at a glance.

So I added a text file to my gitignore and started dumping macros there with notes and explanations, and also the name of the register where that macro currently lives. So now I had a place I could look up, "Where's the one that does x?"

That way I could also record over macros I'm not using right now, but which might come in handy later.

That file, by the way, currently includes one very long macro with the note, "Don't remember what this one is. Looks important though."

Macros are recorded to registers, just like snippets or whatever are saved to registers. Everything you can do with a register you can do with your macro: yank it and put it, append to it. And of course, execute it.

My approach to creating macros usually looks something like this.

1. Start recording to the `q` register: `qq`.
2. Do stuff
3. Stop recording: `q`.
4. Undo all my changes.
5. Play back the macro: `@q`. (I think of `q` as my "quick" register because `qq` is so fast to start recording. I have `@q` aliased to `Q` for (almost) equally quick playback.)
6. See if it does the thing.

Often I need to tweak or debug a macro. In that case, I'll dump it (`"qp`) and squint really hard at it to try to make sense of the sequence of keystrokes.

For example, here's one of my longer ones:

```
:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M^H^H"zpjpdd=i[kf[%k$x
```

I'll describe what this does step by step below. For now, at a high level, it deletes some JSON, yanks some text, jumps to a second buffer and does a look up, jumps to a *third* buffer and yanks a bunch of URLs based on that lookup, goes back to the first buffer, and finally inserts and formats those URLs.

So it does a lot. And sometimes I needed to adjust that macro so it deletes an extra line, or inserts an extra comma somewhere, or whatever.

To do that, I would paste the macro and basically read it and execute it by hand step-by-step. When I got to the part that didn't work the way I wanted it to, I'd go fix that part of the macro and then yank it back to the register (`"qdd`).

And the run it (`@q`) and see if it works.

Hot tip: macros will halt if they encounter an error. A common error for me is searching for some text that doesn't exist. Sometimes I want the macro to continue even if it fails. (Think, search for and replace a string, if it exists, in all these files. You don't want to stop replacing the first time you don't find that string.) This is a great use case for the `e` search flag, which causes vim to silently consume any search errors: `s/something/another thing/e`

One thing I'm not sure about is whether using the new nvim lua API would make procedures like this more readable and reusable. I certainly didn't have the time in the moment to dive into that.

## Other stuff

Some other things I used and skills I sharpened during this work.

### Working with many files

When something was renamed, or if the JSON schema changed, I would do a `:bufdo` to play a macro in all loaded files: `:bufdo normal @q`. Or do a simple replacement: `:bufdo %s/old/new/`

I've since then learned that you can use vimgrep and the quickfix list in a similar way. Not sure if it'd be better or faster, but something to play around with later:

- `:grep foo *.json` (this populates the quickfix list with all matches)
- `:copen` to see all the locations
- `:cn`, `:cp`, etc to jump through the list
- or, `:cdo <cmd>` to execute a command on each line in the list

I'm also interested in using this the next time I have merge conflicts to find everything I need to address: `:grep HEAD ./*`

### Norm

Not the guy from Cheers. Or from Weekend Update.

I did a lot of `:{range}norm {commands}` to execute commands on a selection. e.g., visually select a number of lines, and `:\<,\>norm d2w` to "delete 2 words". (I had a lot of lines that started with a ton of whitespace, and a dash, some more whitespace. This got rid of all that.)


### Expression in a substitution

I had an off by one incrementing error over a large block of text: all the 4's needed to be 3's, all the 3's needed to be 2's etc.

Visually select the block, and `:s/\d\+/\=submatch(0)-1/`.

Neat.

## Conclusion

I guess that's it. This post is mostly for ~mieum, who said they'd be interested in reading about how I use vim registers.

Registers are one of the things for me, along with the movement "language", that make vim "vim". I simply love their versitility and power.

## Appendix

### Resources

- Snippets
    - Why You Should Use Snippets: <https://jdhao.github.io/2020/05/27/why_you_should_use_snippets_in_vim/>
    - ultisnips: <https://github.com/sirver/UltiSnips>
    - CoC Snippets: <https://github.com/neoclide/coc-snippets>
- Quickfix and other tricks: <https://thevaluable.dev/vim-advanced/>
- Using an expression in substitute command: <https://vim.fandom.com/wiki/Using_an_expression_in_substitute_command>
- lua stuff
    - Oli showing off the nvim lua API (via fennel): <https://asciinema.org/a/326401>
    - `:help lua`: <https://neovim.io/doc/user/lua.html>
    - nvim lua guide: <https://github.com/nanotee/nvim-lua-guide>
- Power of g: <https://vim.fandom.com/wiki/Power_of_g>

### That macro

Okay.

```
:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M^H^H"zpjpdd=i[kf[%k$x
```

Here we go.

- `:let @a=''^M`: This just erases the `a` register, because I'm going to be appending to it later. You might often see this done as `qaq`, which starts recording to `a` (`qa`) and then immediately stops recording (`q`). It essentially writes an empty string to that register. The `^M` is a literal Enter. You have to hit enter after commands in command mode.

- `:let @a=''^M` + `/hasimages^M`: search for "hasimages", Enter.

- `:let @a=''^M/hasimages^M` + `ddk$x`: delete a line (`dd`). Go up a line (`k`), go to the end (`$`), and delete a character (`x`). This removes the dangling comma.

- `:let @a=''^M/hasimages^Mddk$x` + `3k$hhyi"`: Go up three lines (`3k`) and go to the end of the line (`$`). Back up two spaces (`hh`) and yank whatever is in double quotes (`yi"`). Probably a better way to do this would be, instead of backing up twice, go back till you find a double quote (`F"`) and then yank inside those quotes (`yi"`).

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"` + `^L/^R"^M`: `^L`, or Control-L, is my alias for `C-w l`. It jumps one buffer to the right. `/` starts a search. `^R"`: Control-r plus whatever inserts the contents of that "whatever" register while in insert mode. `"` is the unnamed register, which holds whatever you just yanked or deleted. So `^R"` will paste that thing what we just yanked in the double quotes in the previous bit. And `^M` is Enter. So, jump right, start a search, insert the thing we just yanked into that search, and then Enter. Search for it.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^M` + `f|lyt|`: Find (`f`) a literal bar (`|`), go to the right (`l`), and yank up to the next bar (`yt|`). This is really specific to the lookup table I had, which was in the format `key|value1|value2`. In this case, I needed `value1` for the next step.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt|` + ` g/^R"/y A^M`: I have `:` mapped to &lt;space&gt; for quicker access to command mode. So `<space>g` here is the same as `:g`, which is the "global" command. `:g/^R"/y A` will find all lines that match the previous yank (remember that `^R"` inserts the contents of the unnamed register, which is currently `value1`), and append them to the `a` register. (Yanking to lowercase `a` overrides the register. Yanking to uppercase `A` appends.) `^M`, again, is Enter. This yanks all the URLs that contain with the string `value1` to `"a`.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M` + `^H^H`: Go back two buffers to the left. Our original buffer. Home sweet home.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M^H^H` + `"zp`: put the contents of register `z`. One of my JSON object snippets.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M^H^H"zp` + `jp`: Go down a line (`j`), and put (`p`) the contents of the unnamed register. Our URLs.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M^H^H"zpjp` + `dd`: Delete a line. I think the `:let @a=''` bit at the beginning writes an empty line to `"a`. So let's get rid of that.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M^H^H"zpjpdd` + `=i[`: `=` aligns/formats text. `i[` is "in square brackets". So this just fixes all the indentation of all the stuff we just pasted into this array.

- `:let @a=''^M/hasimages^Mddk$x3k$hhyi"^L/^R"^Mf|lyt| g/^R"/y A^M^H^H"zpjpdd=i[` + `kf[%k$x`: Go up a line (`k`). Find an open square bracket (`f[`). Jump to its closing bracket (`%`). Go up a line, jump to the end of that line, and delete a character (`k$x`). This deletes a dangling comma.


The end. That was a wacky macro.

changequote`'dnl change quotes `back to default'
include(src/footer.html)
