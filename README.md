# Overview

bootstrap-wysihtml5-sass is a Bootstrap 3 + Sass port of [bootstrap-wysihtml5](http://jhollingworth.github.com/bootstrap-wysihtml5/)

## Project Goals:

1. Provide sass files that automatically inherit bootstrap modifications
2. Add fixes and features to bootstrap-wysihtml5


# Quick Start

## Rails

1. Copy `src/bootstrap-wysihtml5.js`, `src/locales`, and `lib/js/wysihtml5-0.4.0pre.js` to `vendors/assets/javascripts`
2. Copy `src/bootstrap-wysihtml5.scss` to `vendors/assets/stylesheets`
3. Add js to assets pipleline

```coffeescript
# app/assets/javascripts/application.coffee
#= require wysihtml5
#= require bootstrap-wysihtml5
```

4. Add css to assets pipeline

```css
// app/assets/stylesheets/application.scss
@import "bootstrap";
@import "wysihtml5";
```

5. Add `wysihtml5-styles.css` to production config

```ruby
config.assets.precompile += %w( wysihtml5-styles.css )
```

6. Initialize editor in a view

```javascript
$('textarea.wysihtml5').wysihtml5({
  "stylesheets": ["#{asset_path('wysihtml5-styles.css')}"]
});
```

## Other

Copy the following files to your project:

```
lib/js/wysihtml5-0.4.0pre.js
src/bootstrap-wysihtml.js
src/bootstrap-wysihtml5.scss
src/wysihtml5-styles.scss
src/locales/*
```

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

