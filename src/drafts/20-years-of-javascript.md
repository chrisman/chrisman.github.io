Here are notes from reading *JavaScript: The First 20 Years*

## Inspiration

A lot of JavaScript's syntax came from C and, obviously, Java.

Function definitions were allegedly borrowed straight from Awk.

The way `this` works is from Self.

Event listeners were inspired by Apple's HyperCard.

## Stuff I learned

1. The Business Politics of JavaScript

1. The Story of Type Coercion

1. Variability of `this`

2. The binding of a function's `arguments` object to its formal parameters

3. The Name SpiderMonkey

### The Business Politics of JavaScript

Netscape and Sun teamed up to make JavaScript with the intent of putting Microsoft out of business. Or at least to bully them out of the web.

### The Story of Type Coercion

Some of JS's type coercion is credited to a request from internal Netscape users who wanted to quickly and easily do stuff like compare HTTP status codes, and that's why stuff like `404 == "404"` is `true`.

### Variability of `this`

I think I knew this already, but I try to avoid ever using `this` because of buggy and unpredictable reasons such as this, so I haven't had to think about it in a long while.

If a function is called an object method, the value of `this` is the object that called the function.

If it is called directly, the value of `this` is the global object.

### The binding of a function's `arguments` object to its formal parameters

Changing the value of a property on a function's `arguments` object changes the value of its associated named parameter, and vice versa.

You can also access parameter names on the `arguments` object:

```javascript
f(1, 2, 3);
function f(arg1, arg2, arg3) {
  return f.arguments.arg2 // -> 2
}
```

### The Name SpiderMonkey

Chris Houck was the second employee, after Brendan, to work on JavaScript. He named the post-Mocha engine *SpiderMonkey* after this scene from *Beavis and Butt-Head Do America*:

> ATF Agent: [holds up a picture of Beavis & Butt-head] Sir, we're looking for these two fugitives.
>
> Tom: Well, I'll be danged. That's them two kids that have been whacking in my camper.
>
> ATF Agent: You saw these two?
>
> Tom: I sure did. Boy, I've never seen two kids do so much damned whacking.
>
> ATF Agent: [speaking on his walkie-talkie] This is post 9; I have positive ID.
>
> Tom: Boy, they're just like a couple of little old spider monkeys, I'll tell ya that.

## Nostalgia Stuff

1. `void`, as in `<a href="javascript:void clickHandler();">click me</a>`, which you used to have do when inline JavaScript was normal so that the script would evaluate to undefined and not try to evaluate to some URL value. That is, when you want the function to be evaluated solely for its side effects.

1. Having to HTML comment out JavaScript inside your script tags so that old browsers wouldn't just accidentally render all of your script as text:

    ```
    <script>
      <!--
      javascript javascript javascript
      //-->
    </script>
    ```
