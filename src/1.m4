define(__title, `Functional Factories in JavaScript')dnl
define(__subtitle, `An argument against using classes in JavaScript, and using factories instead.')dnl
define(__keywords, `functional programming, object oriented programming, javascript, classes, mixins, sandwiches')dnl
define(__timestamp, 2019-12-15)dnl
define(__id, 1)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Contents

1. [What: Introductions and Definitions](#what-introductions-and-definitions)
    - Background
    - Factories
2. [Why: Problems with Classes](#why-problems-with-classes)
    - There Are No Classes in JavaScript
    - Promotion of "Bad JavaScript"
    - Classical Inheritance
        - The Sandwich Problem
        - The Diamond Problem
        - The Banana Problem
    - Wrong Abstraction
3. [How: Using Factories](#how-using-factories)
    - Factory 101: Creating multiple instances
    - Mixins: Extending a base class
4. [Conclusion](#conclusion)
5. [More: Resources and Notes](#more-resources-and-notes)
    - Further Reading
    - Glossary

## What: Introductions and Definitions

### Background

This article started out as a response to [The Factory Pattern - Design Patterns meet the Frontend][1] by Colum Ferry on dev.to, but at this point I think I rambled in enough different directions that it is no longer a direct response. But that's where my head was at when I started writing this. And now you know.

### Factories
The Factory Pattern is a classic design pattern from the world of <abbr title="Object Oriented Programming">OOP</abbr>, where it is used for one or both of the following reasons:

1. to create multiple instances of a class, and/or

2. to extend a base class. e.g. a `VehicleFactory` might return a `Car` or a `Plane` while hiding the implementation details for a `Vehicle`.

See the [previously mentioned dev.to article][1] for an overview of that functionality.

My intent here is to show how this pattern, with slight modifications, can be used in Functional Programing for pretty much the same reasons.

[1]: https://dev.to/coly010/the-factory-pattern-design-patterns-meet-the-frontend-1p2l

## Why: Problems with Classes

I advocate for using objects and factories and mixins because they are good abstractions, patterns, and practices.

I also advocate for *not* using classes because I think they are not good abstractions.

This section (not so) briefly touches on my main reasons for disliking JS classes, and as such, is intended to serve as a sort of motivation for not using them, and for using the recommended alternatives instead.

The reasons I don't like JS classes are these:

1. There Are No Classes in JavaScript
2. Promotion of "Bad JavaScript"
3. Classical Inheritance
4. Wrong Abstraction

### There Are No Classes in JavaScript

Look, words matter and telling the truth is important.

These are the facts:

- There are no classes in JavaScript
- JavaScript has prototypes

> JavaScript classes, introduced in ECMAScript 2015, are primarily syntactical
> sugar over JavaScript's existing prototype-based inheritance. The class
> syntax does not introduce a new object-oriented inheritance model to
> JavaScript.
>
> [mdn](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)

Before talking about anything else whatsoever--before talking about things like effeciency, correctness, or expressiveness--classes are dishonest representations of how JavaScript works. They hide and obfuscate the way prototypes behave.

At the very worst, they are a gotcha for programmers coming from OOP languages like Java that *actually have* classes, and given that context will expect JS classes to behave a certain way. (In fairness, JS classes mostly *do* behave like classes. But they're still *not* classes.)

### Promotion of "Bad JavaScript"

Before the widespread adoption of classes, it was my personal observation that it was easier to avoid both seeing and using problematic language keywords like `new` and `this`. I see them more frequently now as people wrangle with scoping and binding because of classes.

It also introduces *new* problematic complexity through constructors and `super`. It only takes a few seconds to remember whether you have to call `super` or not, but that lost time is a distraction.

### Classical Inheritance

One of the reasons that OOP is broken/falling out of favor/heavily criticized is because of classical inheritance. And people know this. Even within the OOP community, it is known that *composition is favored over inheritance*.

JS classes promote classical inheritance through use of the `extends` keyword.  That is, creating "is a" relationships between objects: a car "is a" vehicle, and a Toyota "is a" car, and a Prius "is a" Toyota.

Classical inheritance, as a means of describing data, starts to break down
fairly quickly given a small degree of complexity for a couple reasons, including the following: 

1. The Sandwich Problem
2. The Diamond Problem
3. The Banana Problem

#### The Sandwich Problem

There's a whole contentious meme about the Sandwich Problem. People seriously get up in arms about it. My cousin won't even speak to me any more because of the fight we had last Thanksgiving about sandwiches.

Here's your chance to play along, Dear Reader. How many of the following items have an "is a" relationship to "Sandwich?"

- Hoagie
- Taco
- Salad wrap
- Quesadilla
- Raviolli
- Poptart
- Ice Cream Sandwich
- Burrito

Look, here's the deal. The most basic definition of a sandwich is this: some kind of a filling (usually meat, cheese, and/or veggies), enclosed by some kind of a container/wrapper (usually bread).

The very second you try to enforce more than that, stuff falls apart:

- Two slices of bread? What about hinged bread like a subway/hero/footlong/etc?

- Hinged bread is okay? Then why not tacos or gyros? A quesadilla is hinged
  bread.

- If hinged breads are okay then why not "round breads?" What about wraps? What
  about burritos?

- Stuffed sandwiches. Is a pita a sandwich? Is a calzone?

- Is an open faced sandwich a sandwich? (Yes, it is.) Oh, then the filling doesn't even need to be enclosed by the wrapper? Well then, pizza is a sandwich, because what really is the difference between an open faced sandwich and a pizza?

When your job is to describe the relationships between data, when your job is literally to sit around and think about stuff like "is `x` a sandwich?" then "is a" quickly starts to fall apart.

Yes, data is relational. But inheritance still sucks. It's tightly coupled and brittle, and "sandwich" is a nonsense word. 

Here's another approach, to return to our `Vehicle` example. Sure, a boat and a car and a plane are all vehicles. But so is a motorcycle and a bicycle and a horse. A vehicle can have some number of wheels, or some number of hooves.

What defines a vehicle? Some means of moving you from Point A to Point B? In that case, is a human itself a vehicle?

Literally, what is a vehicle? What is the common ancestor of "horse", "airplane," and "rollerblade?"

Given this mental model, for most things you're trying describe, you continue to abstract away the common attributes and behaviors for each *thing* until the base class is something totally stupid and useless like "object."

#### The Diamond Problem

The problem of inheriting from multiple parent classes. Also called, appropriately, the Multiple Inheritance problem.

"Diamond" refers to the shape of the inheritance graph:

```
   [A]      A: office machine
  /   \     B: printer
[B]   [C]   C: copier
  \   /     D: printer/copier
   [D]
```

If you are creating a multifunction office machine like a printer/copier/fax/espresso-maker, then when you're creating functionality for Object D, you may not need to implement your own version of `print` because printers (Object B) and copiers (Object C) both print. But how does the program know *which* parent `print` to use?

Most languages take care of this decision for you as a feature of that language, so you don't have to think about it that much. But the point is, the problem is *there*. It's a flaw inherint to this style of thinking.

#### The Banana Problem

Lastly, the Banana Problem famously describes the problem with state and environment, and a long chain of inheritance.

> ...the problem with object-oriented languages is they've got all this implicit environment that they carry around with them. You wanted a banana but what you got was a gorilla holding the banana and the entire jungle.
>
> Joe Armstrong, Coders at Work

### Wrong Abstraction

Classes are also the wrong abstraction some/most of the time. Or least they're a *limited* abstraction.

Sometimes you do want some kind of a grouping of data and functions. It's tempting to just reach for a class in that case, but you can do the exact same thing with a plain old object, or maybe a function that closes over some data and returns an object.

The point is that you can and should be a little more discerning about the representation you need, and use an abstraction that is only as complicated as you need it to be. First choose an object. Then a function. Then maybe a factory function. And *then* maybe a class. Instead of just always using class, class, class, and class.

It's kind of a case of "If the only tool you have is a hammer, every problem looks like a nail." The ubiquity of JS classes might lead you to believe that classes are the only tools you have, but they are not.

## How: Using Factories

Anyway, enough about stuff that's bad. How about some good stuff that you *should* use? Back to Functional Factories in JS!

Object factories create multiple objects, and can "extend" a "base class" through functional mixins.

### Factory 101: Creating multiple instances

This part is easy. Imagine a car.

Here is an example of object destructuring with default values:

```javascript
const createCar = ({
  make = 'toyota',
  model = 'prius',
  mpg = 80,
  seats = 4
} = {}) => {
  make, model, mpg, seats
}
```

That's an object factory. A function that recieves some data and returns an object.

You can now easily do the following:

```javascript
const car = createCar({
  make: 'Ford',
  model: 'F350',
  mpg: 10,
  seats: 2,
})
```

Boom 💥

No `new`, no `this`. Just plain old objects. Create as many cars as you want.

### Mixins: Extending a base class

Okay, this is where things get a whole lot more functional.

Functional mixins are a good way to avoid and overcome many of the challenges and downfalls of classical inheritance.

They are able to do this because they, as one is encouraged to do even in OOP communities, favor *composition* over *inheritance*.

Imagine, again, we are describing vehicles.

- Don't do this: try to describe some useless, universally abstract base class like `object` that all possible vehicles can inherit from

- Instead do this: just start describing attributes, qualities, and functionality. Keep all those little descriptions in a drawer, and you can mix and match them later to create things.

Here's a mixin for movement:

```javascript
const withMovement = o => {
  let isMoving = false

  return Object.assign({}, o, {
    move() {
      isMoving = true
      return this
    },
    stop() {
      isMoving = false
      return this
    },
    isMoving: () => isMoving,
  })
}
```

I can pass it an empty object and get back an object that has a couple functions on it related to movement. Neat. No muss, no fuss.

Here's one for capacity:

```javascript
const withCapacity = (capacity = 2) => o => {
  let isFull = false;
  let availableSeats = capacity;

  return Object.assign({}, o,
    {
      getAvailableSeats: () => availableSeats,
      getCapacity: () => capacity,
      isFull: () => isFull,
      fillSeats(n) {
        if (n <= availableSeats) availableSeats -= n
        isFull = (availableSeats === 0)
        return this
      },
    }
  )
}
```

It takes a "capacity" parameter (with a default value of 2) and then an object `o`, and returns a new object that combines `o` with some capacity related functions.

Maybe a really simple mixin that creates a new object with some number of wheels:

```javascript
const withWheels = (wheels = 4) => o => Object.assign({}, o, {
  wheels,
})
```

So now I have a few mixins to play with. I can mix and match them to create a factory for a certain kind of vehicle. Say, a car:

```javascript
const carFactory = ({ capacity, wheels }) => pipe(
  withWheels(wheels),
  withMovement,
  withCapacity(capacity),
)({})
```

This factory takes an "init" type object including `capacity` and `wheels`, and then passes those init values into a *pipe* of mixins.

Aside: If you're not familiar with `pipe` or `compose`, just know for now that it's a way to pass a value through a chain of functions, getting a single output at the end. In this case, it's the `o` object in the mixins above. Here's the definition: `const pipe = (...fs) => (x) => fs.reduce((y, f) => f(y), x)`

Anyway, now that we have a car factory, we can create some cars:

```javascript
const bigRig = carFactory({
  capacity: 2,
  wheels: 18,
})

const bus = carFactory({
  capacity: 100,
  wheels: 4,
})
```

Look at that! We have achieved our two goals:

1. We can create multiple, unique objects with our factory

2. They have shared functionality, but not through class or even function
   inheritance, but through the assembly of a few *functional mixins*

If you want to create some different vehicles, you just keep playing Legos and add/remove some additional mixins:

```javascript
const planeFactory = ({ capacity }) => pipe(
  // withWheels(wheels),
  canFly,
  withMovement,
  withCapacity(capacity),
)({})
const bikeFactory = ({ capacity = 1, wheels = 2 }) => pipe(
  nonMotorized,
  withWheels(wheels),
  withMovement,
  withCapacity(capacity),
)({})
const horseFactory = ({ capacity = 1, legs = 4 }) => pipe(
  nonMotorized,
  isAlive(legs),
  withMovement,
  withCapacity(capacity),
)({})
```

So you're no longer creating brittle, tightly coupled relationships between parent and child classes, or even worse, child and parent and grandparent and great-grandparent. Instead you have a series of entities that just happen to share various "can", "with/has", and "is" qualities and attributes.

One place you see this kind of composition is the Entity Component System pattern in video game development. [This post](http://archive.is/VlZ9M) was one of my first insights into how powerful a concept it is.  

## Conclusion

I don't like classes in JavaScript, but I do like plain old objects, object factories, and functional mixins. I think they allow a more natural way of describing data, and that they allow for data to grow in complexity without being too fragile or tightly coupled.

## More: Resources and Notes

### Further Reading

- [The Factory Pattern - Design Patterns meet the Frontend by Colum Ferry](https://dev.to/coly010/the-factory-pattern-design-patterns-meet-the-frontend-1p2l). Inspiration for this post.

- [Composing Software by Eric Elliott](https://medium.com/javascript-scene/composing-software-the-book-f31c77fc3ddc). A series of medium.com articles that took me into the deep end of functional programming and composition.

- [The Power of Lua and Mixins](https://github.com/a327ex/blog/issues/2), 2015. One of my first exposures to ... the power of lua and mixins.

### Glossary

class
:   In "the map is not the terrain" fashion, a class is not an object, but is a description of an object that can be used to create an object.
:   ...except for in JavaScript, where a class is just syntactic sugar for a plain old JavaScript object, providing some convenient access to its prototype.

FP
:   Functional Programming: a style of programming that avoids side effects and embraces snobbery and elitism. Advanced stages of the disease cause the afflicted to say stuff like "A monad is just a monoid in the category of endofunctors, what's the problem?" and, ultimately, to Lisp.

Factory
:   That thing which facilitates the churning out of products

Mixin
:   When you go to Cold Stone and you have a small number of base ice creams, and you can add extra flavor through the incorporation of different *mixins* like oreos or peanuts. You can do the same thing with functions instead of ice cream and add-ons.

OOP
:   Object Oriented Programing: a maligned practice of programming that requires the  memorization of a dozen  or more Design Patterns  to be consistantly useful.

Sandwich
:   No idea. Literally a nonsense word that has no meaning and no definition.

changequote`'dnl change quotes `back to default'
include(src/footer.html)
