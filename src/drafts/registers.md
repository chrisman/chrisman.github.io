# registers #

> a vim story

I was recently complaining/bragging about a complex bit of text editing I was doing. The gist of it was converting an OCR rip of a PDF, full of conversion defects and artifacts, into JSON.

Throughout the course of this task, I started collecting lots of little snippets and macros. And at this point, of my 26 named vim registers (A-Z), I've reserved `"a` and `"b` for general use, and it looks like `"u` is empty. That's it. The other 23 registers are snippets of JSON or special characters saved for quick insertion (™, ®, ½, etc), or macros for transforming stuff, expanding snippets, and moving stuff around.

This is a quick post about how I use those registers, and also a few other random vim tips that I used during this process.

## Snippets ##

I have several templates like this that I need to create constantly:

```
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

I later included these "templates" in macros that were basically "perform this text expansion on these lines of code." In this example, the macro would paste that template and then fill in the URLs or the note IDs.

This is of course a perfect use case for a snippet library like ultisnips or coc-snippets. Except I haven't figured out how to expand a snippet yet inside of a macro. So I went with this more manual method of text expansion, and it worked fine. At the cost of a few registers.

## Macros ##

My macros started getting long and complex.

For a long time I could just `:reg` to see all my registers and their contents, and I could eyeball them and kind of remember what did what. But after a while, it started to require more and more effort to tell them all apart at a glance.

So I added a text file to my gitignore and started dumping macros there with explanations, and the register name where it currently lives. So now I had a place I could look up, "Where's the one that does x?"

That file currently includes one very long macro with the note, "Don't remember what this one is. Looks important though."

Macros are recorded to registers, just like snippets or whatever are saved to registers. Everything you can do with a register you can do with your macro: yank it and put it, append to it. And of course, execute it.

My approach to creating macros usually looks something like this.

1. Start recording to the `q` register: `qq`.
2. Do stuff
3. Stop recording: `q`.
4. Undo all my changes.
5. Play back the macro: `@q`. I think of `q` as my "quick" register because `qq` is so fast to start recording. I have `@q` aliased to `Q` for (almost) equally quick playback.
6. See if it does the thing.

Often I need to tweak or debug a macro. In that case, I'll dump it (`"qp`) and squint really hard at it to try to make sense of the sequence of keystrokes.

For example, here's one of my longer ones:

```
:let @a=''/hasimagesddk$x3k$hhyi"/"f|lyt| g/"/y A"zpjpdd=i[kf[%k$x
```

I'll describe what this does step by step below. For now, at a high level, it deletes some JSON, yanks some text, jumps to a second buffer and does a look up, jumps to a *third* buffer and yanks a bunch of URLs based on that lookup, goes back to the first buffer, and finally inserts and formats those URLs.

So it does a lot. And sometimes I needed to adjust that macro so it deletes an extra line, or inserts an extra comma somewhere, or whatever.

To do that, I would paste the macro and basically read it and execute it step-by-step. When I got to the part that didn't work the way I wanted it to, I'd go fix that part of the macro and then yank it back to the register (`"qdd`).

And the run it (`@q`) and see if it works.

Hot tip: macros will halt if they encounter an error. A common error for me is searching for some text that doesn't exist. Sometimes I want the macro to continue even if it fails. (Think, search for and replace a string, if it exists, in all these files. You don't want to stop replacing the first time you don't find that string.) This is a great use case for the `e` search flag, which causes vim to silently consume any search errors: `s/something/another thing/e`

## Other stuff

Some other things I used and skills I sharpened during this work.

### Working with many files

When something was renamed, or if the JSON schema changed, I would do a `:bufdo` to play a macro in all loaded files: `:bufdo normal @q`. Or do a simple replacement: `:bufdo %s/old/new/`

I've since then learned that you can use vimgrep and the quickfix list in a similar way. Not sure if it'd be better of faster, but something to play around with later:

- `:grep foo *.json` (this populates the quickfix list with all matches)
- `:copen` to see all the locations
- `:cn`, `:cp`, etc to jump through the list
- or, `:cdo <cmd>` to execute a command on each line in the list

I'm also interested in using this the next time I have merge conflicts to find everything I need to address: `:grep HEAD ./*`

### Norm

I did a lot of `:{range}norm {commands}` to execute commands on a selection. e.g., visually select a number of lines, and `:\<,\>norm d2w` to "delete 2 words"


### Expression in a substitution.

I had an off by one incrementing error over a large block of text: all the 4's needed to be 3's, all the 3's needed to be 2's etc.

Visually select the block, and `:s/\d\+/\=submatch(0)-1/`.

Neat.

src: https://vim.fandom.com/wiki/Using_an_expression_in_substitute_command

## Appendix

### Resources

### That macro

```
:let @a=''/hasimagesddk$x3k$hhyi"/"f|lyt| g/"/y A"zpjpdd=i[kf[%k$x
```
