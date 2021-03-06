# Overview

Bootstrap-wysihtml5-sass is a [Twitter Bootstrap 3](http://getbootstrap.com/) + [Sass](http://sass-lang.com/) port of [jhollingworth/bootstrap-wysihtml5](http://jhollingworth.github.com/bootstrap-wysihtml5/).

## [Demo](http://simple10.github.io/bootstrap-wysihtml5-sass/)

## Changelog

[Oct 30, 2013]

* **Dynamic resize**. Resize iframe on image inserting, typing, deleting, pasting.
Intelligently scroll to keep editor in view.
* **Dynamic menu updating**. Display current block style and color in drop down menu.
* **Added dependency** imagesLoaded.js


## Project Goals:

1. Provide sass files that automatically inherit bootstrap modifications
2. Add fixes and features to bootstrap-wysihtml5


# Quick Start

## Rails

[1] Copy javascripts

```bash
src/bootstrap-wysihtml5.js
src/locales/*
lib/js/wysihtml5-0.4.0pre.js
lib/js/imagesloaded.js
lib/js/underscore.js
# Copy to => vendors/assets/javascripts
```

Note that underscore is optional. Simply replace references to _.debounce with
another debounce function in bootstrap-wysihtml5.js.

[2] Copy stylesheets

```bash
src/bootstrap-wysihtml5.scss
# Copy to => vendors/assets/stylesheets
```

[3] Add js to assets pipleline

```coffeescript
# app/assets/javascripts/application.coffee
#= require underscore
#= require imagesloaded
#= require wysihtml5
#= require bootstrap-wysihtml5
```

[4] Add css to assets pipeline

```css
// app/assets/stylesheets/application.scss
@import "bootstrap";
@import "wysihtml5";
```

[5] Add `wysihtml5-styles.css` to production config

```ruby
config.assets.precompile += %w( wysihtml5-styles.css )
```

[6] Initialize editor in a view

```javascript
$('textarea.wysihtml5').wysihtml5({
  "stylesheets": ["#{asset_path('wysihtml5-styles.css')}"]
});
```

## Other

Copy the following files to your project:

```
src/bootstrap-wysihtml5.js
src/locales/*
lib/js/wysihtml5-0.4.0pre.js
lib/js/imagesloaded.js
lib/js/underscore.js
src/bootstrap-wysihtml5.scss
src/wysihtml5-styles.scss
```

Compile sass files as needed or use precompiled versions in [/compiled/](https://github.com/simple10/bootstrap-wysihtml5-sass/tree/master/compiled).

Initialize the editor:

```javascript
$('textarea.wysihtml5').wysihtml5({
  "stylesheets": ["/path/to/wysihtml5-styles.css"]
});
```


# Options

An options object can be passed in to .wysihtml5() to configure the editor:

```javascript
$('#some-textarea').wysihtml5({someOption: 23, ...})
```

## Buttons

To override which buttons to show, set the appropriate flags:

```javascript
$('#some-textarea').wysihtml5({
	"font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
	"emphasis": true, //Italics, bold, etc. Default true
	"lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
	"html": false, //Button which allows you to edit the generated HTML. Default false
	"link": true, //Button to insert a link. Default true
	"image": true, //Button to insert an image. Default true,
	"color": false //Button to change color of font
});
```

## Stylesheets

To provide a stylesheet to the editor iframe, set the stylesheets config option.

```javascript
$('#some-textarea').wysihtml5({
	"stylesheets": ["/path/to/editor.css"]
});
```

# Documentation

See [jhollingworth/bootstrap-wysihtml5](https://github.com/jhollingworth/bootstrap-wysihtml5) and [xing/wsysihtml5](https://github.com/xing/wysihtml5) for additional documentation.

