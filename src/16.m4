define(__timestamp, 2020-11-20)dnl
define(__title, `How to theme a website')dnl
define(__subtitle, `a practical guide to site themes with a tiny bit of design system theory')dnl
define(__keywords, `')dnl
define(__id, 16)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

## Contents

1. [Introduction](#introduction)
2. [Applications](#applications)
3. [Choosing A Color Palette](#choosing-a-color-palette)
4. [Creating Variables](#creating-variables)
5. [Building a bridge](#building-a-bridge)
6. [Theme Toggle](#theme-toggle)
7. [Persisting, Like Elizabeth Warren](#persisting-like-elizabeth-warren)
8. [Queries](#queries)
9. [Conclusion](#conclusion)

## Introduction

I've spent the last month or so working on a whitelabel e-commerce platform, the main features of which are:

1. a well documented component library and design system, and

2. being highly customizable through supposting custom themes.

I'd like to use this this space to document and share the most basic elements of site theming using just CSS variables. That is, vanilla CSS and JavaScript, with no preprocessors.

I'll also share a little bit of design system theory.

## Applications

Why would you care to read this?

Perhaps you too are developing a large customizable whitelabel e-commerce platform. But most likely you are not. Which is fine. After all, the overwhelming majority of us aren't.

Perhaps you are merely curious.

Or, perhaps you would like provide your readers with an option between a dark theme and a light theme.

Perhaps you would even like to anticipate your reader's preference through use of [the `prefers-color-scheme` query](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme), and deliver to them the color scheme of their preference.

## Choosing A Color Palette

At the foundation of most design systems is the belief that there are things like colors and also typographic attributes such as font size and font weight that can and ought to exist in a vacuum. That is, they exist indepently of any page elements.

For example, you can [define a type scale](https://type-scale.com/?size=20&scale=1.333&text=Alas%20Poor%20Yorrick&font=Poppins&fontweight=400&bodyfont=body_font_default&bodyfontweight=400&lineheight=1.75&backgroundcolor=%23ffffff&fontcolor=%23000000&preview=false) that as yet has nothing to do with your page titles. The scale just *is*. You can decide later which elements to apply the scale to. Maybe you'll choose to only support three levels of headings, so you want a more dramatic scale, like that Golden Ratio over which certain nerds like nerd out so hard.[^2]

We'll get more into the benefits of this in just a bit.

Let us focus for now on color, and let us define a color palette in a vacuum. One that has of yet nothing whatsoever to do with our site content or page elements.

Now we could do something predictable and grab a palette from somewhere like [colourlovers](https://www.colourlovers.com/palette/1961618/Pueblo_CO_1976), but why be such a normie pedestrian when we could do something fabulous and instead browse [beyonce palettes](https://beyoncepalettes.tumblr.com/) for inspiration.

Here's one:

<div class="palette u-full-width">
<div class="palette__color" style="background-color:rgb(41, 112, 119);"></div>
<div class="palette__color" style="background-color:rgb(45, 172, 183);"></div>
<div class="palette__color" style="background-color:rgb(161, 174, 147);"></div>
<div class="palette__color" style="background-color:rgb(219, 181, 170);"></div>
<div class="palette__color" style="background-color:rgb(217, 165, 191);"></div>
<div class="palette__color" style="background-color:rgb(170, 88, 195);"></div>
</div>
<style>
.palette {
display: flex;
height: 300px;
}
.palette__color {
flex: 1;
}
</style>

That'll do nicely.

You can call these colors whatever you want. I think we'll go with teal, blue, green, peach, pink, and purple.

## Creating Variables

The first thing you really need to do is get your shit together and start using CSS variables, which are just like variables in other programming languages.[^3]

They require you to use a specific `--var-name` syntax, and it is conventional to define these variables on the `:root` pseudoelement so that they cascade real good.

So if we were to define our beyonce color variables, it'd look a little something like this.

```css
:root {
  --c-teal: #297077;
  --c-blue: #2DACB7;
  --c-green: #A1AE93;
  --c-peach: #DBB5AA;
  --c-pink: #D9A5BF;
  --c-purple: #AA58C3;
}
```

There. We have some color options which are now available throughout the document, and you can access them wherever you like by using `var`.

```css
body {
  background-color: var(--c-teal);
  color: var(--c-pink);
}
```

`var` supports multiple fallbacks. So you can do something like:

```css
background-color: var(--theme-background-color, var(--default-background-color), #333);
```

## Building a bridge

An astute reader may recall that I said colors and typographic elements and whatnot can exist in a vacuum. And yet here I am doing a tight coupling of color directly to DOM elements. There is nothing at all vacuum-like about this!

Forgive me. I have over-simplified for the sake of demonstration.

In practice, a design system would ask you to create a mapping, a bridge, from a value to page element.

```css
:root {
  /* colors */
  --c-teal: #297077;
  --c-blue: #2DACB7;
  --c-green: #A1AE93;
  --c-peach: #DBB5AA;
  --c-pink: #D9A5BF;
  --c-purple: #AA58C3;

  /* LOOK HERE! mappings */
  --page-background-color: var(--c-teal);
  --page-content-color: var(--c-pink);
}

body {
  background-color: var(--page-background-color);
  color: var(--page-content-color);
}
```

The reason I like this abstraction is for its simplicity and its semantics:

1. **Simplicity**: I can now add, remove, tweak, or swap out colors at the color value level without worrying that much about how it will effect my DOM elements. I can adjust the brightness of "pink" in isolation without thinking about headers or links.

2. **Semantics**: You can create more useful variable names now. Consider `--c-danger` and `--c-warning`. It is *much* more meaningful to set an element's color to one of those variable names than to the opaque `#D9534F` or even to the slightly better `--c-red`.

This mapping cordially escorts the designer from a simple list of available colors, to a more discreet and meaningful list of *contexts*. No longer do we merely have teal, blue, pink, green. Now we have the infinitely more useful `--page-background-color` and `--page-title-color`, and more.

This is the big idea behind design tokens:

> Variables take the mystery out of obscure values. But they don’t bridge the gap between naming and use. They answer “What options do I have?” yet leave “What choice do I make?” unclear. A system’s strength comes from knowing how to apply options (like $color-neutral-20) to contexts (like a conventional dark background color). This grounds the option as a decision.
>
> <cite><a href="https://archive.is/RFTXV">Tokens in Design Systems, Nathan Curtis</a></cite>

## Theme Toggle

This is a page theme toggle. (**Caution**: this will go from quite dark to quite bright!)

<div class="theme-select"> <label><span>Dark</span> <input type="radio" id="default" name="themeSelect" value="default" checked> </label> <label><span>Beyonce</span> <input type="radio" id="beyonce" name="themeSelect" value="beyonce"> </label> </div>
<style>
.theme-select {
  background-color: var(--c-transparency-light);
  display: flex;
  flex-direction: column;
}
</style>
<script>
const colors = {
  teal   : '#297077',
  blue   : '#2DACB7',
  green  : '#A1AE93',
  peach  : '#DBB5AA',
  pink   : '#D9A5BF',
  purple : '#AA58C3',
}
const beyonce = {
  backgroundColor : colors.purple,
  contentColor    : colors.peach,
  headerColor     : colors.green,
  linkColor       : colors.teal,
};
document.getElementsByName('themeSelect')
.forEach(radio => radio.addEventListener('change', evt => {
  const b = (evt.target.value === 'beyonce')
  body.style.setProperty('--background-color' , b ? beyonce.backgroundColor : 'var(--c-dark)')
  body.style.setProperty('--content-color'    , b ? beyonce.contentColor    : 'var(--c-light)')
  body.style.setProperty('--header-color'     , b ? beyonce.headerColor     : 'var(--c-primary)')
  body.style.setProperty('--link-color'       , b ? beyonce.linkColor       : 'var(--c-primary-variant)')
}));
</script>

It uses the CSS variables that exist on this page, and the `element.style.setProperty` method to set them on the `body` element.

Were we designing a component, we would instead set the property on the component wrapper.

```javascript
// kind of pseudocode incoming
forEach(radio => radio.addEventListener('change', evt => {
  const b = (evt.target.value === 'beyonce')

  body.style.setProperty('--background-color' , b ? beyonce.backgroundColor : 'var(--c-dark)')
  body.style.setProperty('--content-color'    , b ? beyonce.contentColor    : 'var(--c-light)')
  body.style.setProperty('--header-color'     , b ? beyonce.headerColor     : 'var(--c-primary)')
  body.style.setProperty('--link-color'       , b ? beyonce.linkColor       : 'var(--c-primary-variant)')
}));
```

Above, assume I've already created a `beyonce` object of color values. And I also just happen to know that `--c-dark` & Co. are default color values.


## Persisting, Like Elizabeth Warren

> Nevertheless, she persisted.

So the point of all this is that you can save and persist these color values. Perhaps, for example, in a JS module on disk...

```js
export default {
  '--theme-background-color' : '#DBB5AA',
  '--theme-content-color'    : '#AA58C3',
  '--theme-link-color'       : '#A1AE93',
  '--theme-header-color'     : '#297077',
}
```

...or maybe over a network call to a CMS or configuration server somewhere.

Or, as we will do here, in local storage.

Below is a theme editor that will, similar to the radio toggle above, change how this page looks, but with the added feature of allowing you to save your theme.

<div class="theme-editor"> <label><span>background color</span><span class="spacer"></span><input value="#212424" id="backgroundColor" type="color"></label> <label><span>content color</span><span class="spacer"></span><input value="#E1E1E1" id="contentColor" type="color"></label> <label><span>link color</span><span class="spacer"></span><input value="#00FFFF" id="linkColor" type="color"></label> <label><span>header color</span><span class="spacer"></span><input value="#008b8b" id="headerColor" type="color"></label> <p><button class="theme-editor__save">save</button></p> </div>

<style>
.theme-editor {
  background-color: var(--c-transparency-light);
  padding: var(--spacer-xs);
  display: flex;
  flex-direction: column;
}

.theme-editor label {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.theme-editor .spacer {
  flex: 1;
}
</style>
<script>
const body = document.querySelector('body');

['background', 'content', 'header', 'link']
.map(x => [`#${x}Color`, `--${x}-color`])
.forEach(x => {
  document.querySelector(x[0])
  .addEventListener('change', evt => {
    body.style.setProperty(x[1], evt.target.value);
  });
});

document.querySelector('.theme-editor__save')
.addEventListener('click', evt => {
  const theme = {};
  ['background', 'content', 'header', 'link']
  .map(x => [`#${x}Color`, `--${x}-color`])
  .forEach(x => {
    theme[x[1]] = document.querySelector(x[0]).value
  });
  localStorage.setItem('theme', JSON.stringify(theme));
  document.querySelector('.themeDisplay').value = JSON.stringify(theme);
});
</script>

<label style="display:flex;"><span style="margin-right:var(--spacer-xs)">Your theme (once saved):</span><input style="flex:1;" class="themeDisplay" value="..."></input></label>

**Invitation**: Made a theme you like? [Share it with me](contact.html) and I'll post it here for all to see![^4]

**Note**: To revert back to the default color scheme, delete the `theme` key from your local storage. Or, refresh this page and click `save` again. (The editor loads the default dark theme by default.)

Same concept here for updating the page:

```js
inputs.addEventListener('change', evt => {
  const el = document.querySelector('.someParentElement');
  el.style.setProperty('--background-color', evt.target.value);
}
```

And we add a little splash of localStorage to the button click:

```js
button.addEventListener('click', () => {
  const theme = {};

  // e.g. { name: '--background-color', selector: '#backgroundColor' }
  forEach(({ name, selector }) => {
    theme[name] = document.querySelector(selector).value
  });

  localStorage.setItem('theme', JSON.stringify(theme));
});
```

Now all I have to do is add a little javascript to the site header[^1] to load a theme object from localstorage.

```js
document.addEventListener('DOMContentLoaded', e => {
  const body = document.querySelector('body');

  const theme = JSON.parse(localStorage.getItem('theme'));

  theme && Object.keys(theme).forEach(key => {
    body.style.setProperty(key, theme[key]);
  });
});
```
## Queries

For completion's sake, since I mentioned it at the beginning of this article, here's how you can query for a user's color preference. It's just a standard media query just like any other!

```css
@media (prefers-color-scheme: dark) {
  body {
    --background-color: var(--c-dark);
    --content-color: var(--c-light);
    --header-color: var(--c-primary);
    --link-color: var(--c-primary-variant);
  }
}

@media (prefers-color-scheme: light) {
  body {
    --background-color: var(--c-light);
    --content-color: var(--c-dark);
    --header-color: var(--c-primary);
    --link-color: var(--c-primary);
  }
}
```

## Conclusion

That's it. This is the end.

The main point of all this is this:

1. List out all your style options in CSS variables: font sizes and font families, spacers (for margins and paddings), colors, shades, and tints. Etc.

2. Create more CSS variables for your theme. Brand colors: primary, secondary, etc. At this tier you can assign the literal values to semantic contexts. E.g. "headings get brand color 'teal'".

Now you're all set up to create sweeping changes to your page theme by changing the values of those semantic contexts.


[^1]: This is the very first bit of JavaScript I will have added to this site! I feel a little sad to no longer be able to say that this site contains no javascript. But I am happy to add this little bit for the purposes of demonstrating this concept. This site certainly continues to not *depend* on js, or to use it in excess or superfluously.

[^2]: If you remain blissfully unaware of the awe and the commitment that design/math nerds have for this pattern, you need look no further than [a search for golden ratio tattoos](https://duckduckgo.com/?q=golden+ratio+tattoo&ia=images&atb=v230-1&iax=images).

    I agree wholeheartedly that the visual calculation of the numbers is immensely satisfying. And so the appeal of using them in web design is in theory obvious and apparent. In practice the scale may even be suitable for designing a page layout. But, tragically, it is [far too dramatic to use as a type scale](https://type-scale.com/?size=20&scale=1.618&text=Too%20Much%20Scale&font=Poppins&fontweight=400&bodyfont=body_font_default&bodyfontweight=400&lineheight=1.75&backgroundcolor=%23ffffff&fontcolor=%23000000&preview=false) unless you want your headers to be oppressively large and your small text to be insufferably small.

    And you don't want that. If there's something we can all agree on, surely it's that we want our web design to be free of oppression and suffering.

[^3]: Yes, that's right. I just suggested that CSS is a programming language: it has variables and `calc`. Fight me.

[^4]: Theme showcase! Copy and paste the object into `theme` in local storage.

    - Bubblegum, by me: `{"--background-color":"#ff84ff","--content-color":"#9437ff","--header-color":"#ff2f92","--link-color":"#0432ff"}`

changequote`'dnl change quotes `back to default'
include(src/footer.html)
