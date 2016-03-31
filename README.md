# chrisman.github.io

My portfolio and resume.

## About

Both my resume and my portfolio are JSON objects that are consumed and parsed by an Angular.js frontend.

CSS framework by Bulma, because why not try something besides Bootstrap?

## Schema

__resume__

* [use the JSONresume schema](https://jsonresume.org/schema/)

__Portfolio__

```
[
  {
    "title": "awesomeproject",
    "subtitle": "hold on to your butts",
    "description": "it's a butt cannon",
    "date": "YYYY-MM-DD",
    "imageUrl": "http://gif",
    "links": {
      "deployed": {
        "url": "url",
        "name": "sitename"
      },
      "source": {
        "url": "url",
        "name": "github"
      }
     },
    "keywords": [ ]
  }
]
```

## Resources

* [Write valid JSON](http://jsonlint.com/)

* [bulma.io](http://bulma.io/)

* [lodyas](http://subtlepatterns.com/dark-sharp-edges/)

* [jsonresume](https://jsonresume.org/schema/)
