'use strict'


window.wysihtml5.defaults =
  # Editor instance name.
  # Name will also be set as class name on the editor iframe and body.
  # Default: undefined
  name: undefined

  # Id of the toolbar element or DOM node, pass false value if you don't want any toolbar logic
  # Default: undefined
  toolbar: undefined

  # Toolbar menu items.
  # Items match keys in templates and locales.
  # Default: undefined
  toolbarItems:
    font_styles: true
    color: true
    emphasis: true
    link: true
    lists: true
    image: true
    video: true
    html: true

  # Locale to use for toolbar templates.
  # Default: undefined
  locale: 'en-US'

  # Class name to add to toolbar buttons.
  # Used by toolbar templates.
  # Default: ''
  toolbarBtnClass: 'btn btn-default btn-sm'

  # Toolbar item templates.
  # Automatically set to window.wysihtml5.toolbarTemplates unless defined here.
  # Default: window.wysihtml5.toolbarTemplates
  toolbarTemplates: null

  # Line break element.
  # Insert a <br> for line breaks if true, otherwise use <p> if false.
  # Default: true
  useLineBreaks: false

  # Automatically resize iframe to fit content.
  # Default: false
  enableAutoResize: true

  # Automatically turn urls into clickable links.
  # Default: true
  autoLink: true

  # Apply styles from textarea to editor.
  # Default: true
  style: true

  # Class name which should be set on the contentEditable element in the created sandbox iframe.
  # Can be styled via the 'stylesheets' option.
  # Default: 'wysihtml5-editor'
  composerClassName: 'wysihtml5-editor'

  # Class name to add to the parent body when the wysihtml5 editor is supported.
  # Default: 'wysihtml5-supported'
  bodyClassName: 'wysihtml5-supported'

  # Stylesheet urls to load in the editor iframe
  # Default: []
  stylesheets: ['compiled/wysihtml5-styles.css']

  # Classes to exclude from copying from textarea to editor body.
  # Default: undefined
  excludeClasses: 'text optional form-control'

  # Render editor on touch devices; wysihtml5 >= 0.3.0 comes with basic support for iOS 5
  # Default: true
  supportTouchDevices: true

  # Clean up empty <span> elements
  # Default: true
  cleanUp: true

  # Parser method to use when the user inserts content via copy & paste or edits html.
  # Default: wysihtml5.dom.parse
  parser: wysihtml5.dom.parse

  # Parser rules.
  # Tags and classes not listed in parserRules will be stripped out of html.
  # https://github.com/xing/wysihtml5/blob/master/parser_rules/advanced.js
  parserRules:

    # Allowed CSS class names.
    # CSS classes are defined in wysihtml5-styles.
    classes:
      'wysiwyg-color-1': 1
      'wysiwyg-color-2': 1
      'wysiwyg-color-3': 1
      'wysiwyg-color-4': 1
      'wysiwyg-color-5': 1
      'wysiwyg-color-6': 1
      'wysiwyg-color-7': 1
      'wysiwyg-object-container': 1
      'wsyiwyg-image': 1

    tags:
      b: {}
      i: {}
      br: {}
      ol: {}
      ul: {}
      li: {}
      h1: {}
      h2: {}
      h3: {}
      h4: {}
      h5: {}
      h6: {}
      blockquote: {}
      u: {}
      span: {}
      p: {}

      # Allow save and edit files with code tag hacks.
      code: {}
      pre: {}

      strong:
        rename_tag: 'b'

      div:
        set_class: 'wysiwyg-object-container'

      img:
        check_attributes:
          src: 'src'
          width: 'numbers'
          height: 'numbers'
          alt: 'alt'
        set_class: 'wysiwyg-image'

      # Iframe is needed for videos.
      iframe:
        check_attributes:
          src: 'src'
          width: 'numbers'
          height: 'numbers'
        set_attributes:
          frameborder: 0
          allowfullscreen: 'allowfullscreen'

      a:
        check_attributes:
          # Important to check href to avoid XSS.
          href: 'href'
          target: 'alt'
          rel: 'alt'
