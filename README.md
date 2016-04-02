# chrisman.github.io

My portfolio and resume.

## About

Both my resume and my portfolio are JSON objects that are consumed and parsed by an Angular.js frontend.

CSS framework by Bulma, because why not try something besides Bootstrap?

## Schema

There are several resume json schema avaiable. I didn't really look for a portfolio schema before starting to make my own, so it's very possible that I have reinvented the wheel here.

__resume__

* [use the JSONresume schema](https://jsonresume.org/schema/)

__Portfolio__

```
[
  {
    "title": "awesomeproject",
    "subtitle": "you won't believe how awesome",
    "description": "it's a butt cannon",
    "date": "YYYY-MM-DD",
    "imageUrl": "http://website.tld/filename.gif",
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
    "keywords": [ 
      "mongodb", "express", "angular.js", "node"
    ]
  }
]
```

## Resources

* [Write valid JSON](http://jsonlint.com/)

* [bulma.io](http://bulma.io/)

* [lodyas](http://subtlepatterns.com/dark-sharp-edges/)

* [jsonresume](https://jsonresume.org/schema/)
