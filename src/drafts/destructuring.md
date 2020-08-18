---
author: chrisbrown
title: Destructuring in JavaScript
subtitle: destructuring objects and arrays
date: 2020-01-01
keywords: javascript
...

This is the post that inspired me to start blogging again. It has sat in my drafts folder for far too long, and shall now see the light of day!

Destructuring arrays and objects in JavaScript is something I enjoy doing and something I enjoy teaching other people about.

## Destrucutring Arrays

Trick: swapping variables

```javascript
let a = 'apple'
let b = 'banana'

[ a, b ] = b, a

console.log(a) // -> banana
console.log(b) // -> apple
```

Neat!

## Destructuring Objects

## Resources

- <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment>
