define(__timestamp, 2020-08-16)dnl
define(__title, `phone numbers')dnl
define(__subtitle, `a reflection on personal growth and code quality')dnl
define(__keywords, `javascript complexity')dnl
define(__id, 12)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Contents

1. Introduction
1. Original submission
2. Rewrite
3. Conclusion

## Introduction

When I first applied to my codeschool bootcamp in 2015, I was given an assessment problem to solve as part of the application process.

The problem statement was something like this:

> Given an array of phone numbers, return the number whose sum of all its individual digits is greatest.

I found my original submission the other day while going through some old files.

## Original submission

It is definitely kind of awful.

And I will share it here in its entirety without shame or embarrassment, because I was just a little baby at the time I wrote it. We all start somewhere.

Don't spend too much time trying to read it. It's kind of obtuse, and I'm going to criticize its weak points below anyway.

```javascript
var numbers = [7205551706, 3035559252, 3035556963, 7205551236];

function format_phone_numbers() {
  //TODO: make sure hypens, white space, parents, etc are stipped out.
}

function get_index_of_largest_element(array, index) {
  if (index > 0) {
    return array.indexOf(Math.max(array[index], get_largest_element(array, index - 1)));
  } else {
    return array[0];
  }
}

function return_index(a) {
  return get_index_of_largest_element(a, a.length - 1);
}

function get_largest_element(array, index) {
  if (index > 0) {
    return Math.max(array[index], get_largest_element(array, index - 1));
  } else {
    return array[0];
  }
}

function return_element(a) {
  return get_largest_element(a, a.length - 1);
}

function add_digits_in_number(n, sum) {
  if (n > 0) {
    sum += (n % 10);
    return add_digits_in_number(Math.floor(n / 10), sum);
  } else {
    return sum;
  }
}

// This wrapper is necessary for the .map function used below.
function return_sum(n) {
  return add_digits_in_number(n, 0);
}

function show(msg) {
  alert(msg);
}

var new_array = numbers.map(return_sum);
//show(numbers[return_index(new_array)]);
```

A couple of things stand out to me right away upon attempting to read this:

1. **Hubris and recursion**. I was definitely trying to show off that I knew what recursion is. Recursion is a fine tool to use for summing up the individual digits of a long number. But there was no reason to use it for a task like finding the largest number in a list of numbers. The fact that I knew about `Array.map` suggests that I probably knew about `Array.reduce` but either didn't understand its use case here, or, again, was simply trying to show off with another unnecessary recursion.

2. **Needless abstractions**. This reads like I just discovered what a function was. And that's probably true of myself at the time to be honest. Early in my life of code, I was used to writing very imperatively. At this point, it looks as though I had swung hard around to the belief that every individual thought or concept should be its own abstraction. Abstractions should be used to reduce complexity. And ironically, I think that this proliferation of functions only serves to *increase* complexity because the reader has to keep them all in mind and remember what they do and understand how they interact with each other. Especially the wrapper functions, which are poor abstractions, because they don't really do anything other than create a relationship to another function without actually doing anything. They take up mental overhead for no good reason.

3. **No concept of modules**. This isn't written in a way to be used by other files, or to be imported into a test suite. But mostly, I just think it's funny that I used `window.alert` to "return" the value.

4. **Weird naming conventions**. I don't know why I was all about that underscore 🤣. Also, there being way too many abstractions means that poor function naming, combined with a lack of comments, makes it hard to understand the relationships between certain abstractions. Like `return_element` and `get_largest_element`. And `return_index` and `get_index_of_largest_element`. Actually, I just now noticed that `return_element` isn't even being called anywhere 🤣

## Rewrite

If I had to do it again today, I would say there are basically two things to reason about:

1. Given a multi-digit number, return the sum of its digits.

2. Given an array, return the largest number.


```javascript
// sums the individual digits in a multi-digit number
const sumOfDigits = (num, sum = 0) => (num === 0) ? sum : sumOfDigits(Math.floor(num / 10), sum + num % 10)

// return the number whose sum of its digits is largest
const greatestSum = (nums) => nums.reduce((a, b) => sumOfDigits(a) > sumOfDigits(b) ? a : b)

// usage:
const numbers = [7205551706, 3035559252, 3035556963, 7205551236]
greatestSum(numbers)     // -> 3035556963
numbers.map(sumOfDigits) // -> [ 38, 40, 47, 39 ]
```

One thing that keeps tickling the back of my brain as I write this though is my suspicion that this is not a question of process or procedure, but instead it is one of representing data.

I can't know this in the contrived isolation of this exercise, but when I imagine using this bit of code somewhere, it makes me wonder about *why* we need it, and whether the information might need to be preserved in a data structure. That is to say, whether the `sumOfDigits`s ought to be preserved in a data structure instead of being mere side effects of the computation of `greatestSum`. I just really hate throwing data away.

In which case my solution might be to map the phone numbers to something like this, and then iterate over it, preserving this structure as some kind of a state object:

```javascript
[
  {
    number: 7205551706,
    sum: 38,
  },
  {
    number: 3035559252,
    sum: 40,
  },
  {
    number: 3035556963,
    sum: 47,
  },
  {
    number: 7205551236,
    sum: 39,
  }
]
```

Excessive perhaps in this example since `sum` is a fairly simple computed value. But still, this pattern of "process this list and associate data with each list member" is a pattern that I've seen often at this point. Frequently, for example, in the form of "count the number of occurrences of each member in the list." And when encountering this pattern, I tend to favor just keeping all the data in a single structure as above for easy retrieval.

## Conclusion

Anyway, I wrote all this because I found an old snippet of code I wrote at the very beginning of my career in software, and I thought it was interesting to not just try to one-up my past self, but to try to think about how my thinking and reasoning has changed in regards approaching problems and organizing code.

My main, oversimplified takeaways are these:

1. Problems tend to be data structure problems, not algorithmic ones

2. Abstractions only exist to [reduce complexity](https://chrismanbrown.gitlab.io/4.html). At the point that your abstractions are *increasing* complexity, something has gone wrong.

changequote`'dnl change quotes `back to default'
include(src/footer.html)

