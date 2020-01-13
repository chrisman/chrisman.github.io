---
author: chrisbrown
title: navigating and manipulating text with vim
subtitle: getting around and simple edits
date: 2020-01-09
keywords: vim
...

vim is the single greatest productivity tool that I have. Here's some of what I consider to be "the basics" of using vim effectively.

- hjkl: simple movement
    - no better than arrow keys
- nouns
    - small blocks of text
        - linenumbers, G
        - f, t
        - words: w e b
        - lines: 0, ^, $
    - large blocks of text
        - sentences
        - paragraphs
    - file
        - g, gg
        - HML
        - zt, zb, zz
    - advanced nouns: marks
        - m ' `
- sentences (verbs and verb phrases)
    - verbs
        - y, c, d
    - adverbs
        - i, a, t, f
- repeatition
    - numbers
    - dot
- registers: a place to put your stuff
    - unnamed register
    - yank and appending
    - putting
    - other registers
- macros
    - executing registers
