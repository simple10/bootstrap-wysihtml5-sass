'use strict'

$ = jQuery
wysihtml5 = window.wysihtml5
wysihtml5.toolbarTemplates ||= {}

class Wysihtml5
  constructor: (el, options) ->
    @el = el
    @toolbar = @createToolbar(el, options)
    @editor = @createEditor(options)
    @initMenuUpdates()

    @editor.on 'load', =>
      @excludeClasses options.excludeClasses if options.excludeClasses
      @initAutoResize options if options.enableAutoResize

    $(@editor.composer.iframe.contentWindow).on 'focus.wysihtml5': ->
      $('li.dropdown').removeClass 'open'

  createEditor: (options) ->
    options = options or {}

    # Add the toolbar to a clone of the options object so multiple instances
    # of the WYISYWG don't break because 'toolbar' is already defined
    options = $.extend(true, {}, options)
    options.toolbar = @toolbar[0]
    editor = new wysihtml5.Editor(@el[0], options)
    if options and options.events
      for eventName of options.events
        editor.on eventName, options.events[eventName]
    editor

  createToolbar: (el, options) ->
    toolbar = $ '<ul/>',
      class: 'wysihtml5-toolbar'
      style: 'display:none'

    # Build toolbar
    tpls = options.templates
    for key of options.toolbarItems
      continue unless options.toolbarItems[key] and tpls[key]
      tpl = new tpls[key](options.locale, options, this)
      toolbar.append tpl.$tpl

    # Attach to DOM
    options.toolbar and toolbar.appendTo(options.toolbar) or @el.before(toolbar)
    toolbar

  excludeClasses: (classes) ->
    $(@editor.composer.iframe).contents().find('body').removeClass(classes)

  initMenuUpdates: ->
    # Assign unique ids to dropdown menus for faster lookup
    idcnt = 0
    @toolbar.find('.dropdown').each ->
      idcnt++
      $(this)
        .data('dropdown-id', idcnt)
        .find('.dropdown-menu a')
        .data('dropdown-id', idcnt)

    # Monkey patch addClass and removeClass.
    # Ideally, wysihtml5 would provide events so monkey patching is not needed.
    _addClass = wysihtml5.dom.addClass
    _removeClass = wysihtml5.dom.removeClass
    self = this

    wysihtml5.dom.addClass = (el, className) ->
      self.updateDropdownMenus($(el)) if className is 'wysihtml5-command-active'
      _addClass.call this, el, className

    # Special handling of resetting menus is needed when the current node
    # does not have any styling but the menu is set to the previous node value.
    _resetMenus = {}
    _resetMenusTimeout = null
    wysihtml5.dom.removeClass = (el, className) ->
      if className is 'wysihtml5-command-active'
        $el = $(el)
        if id = $el.data('dropdown-id')
          _resetMenus[id] ||= $el.parent().parent().parent('.dropdown') || null
          # Reset menus once per animation frame
          _resetMenusTimeout ||= setTimeout ->
            self.resetDropdownMenus(_resetMenus)
            _resetMenus[i] = null for i of _resetMenus
            _resetMenusTimeout = null
          , 0
      _removeClass.call this, el, className

  updateDropdownMenus: (active, menu) =>
    active ||= @toolbar.find 'a.wysihtml5-command-active'
    active.each ->
      $a = $(this)
      dropdown = menu || $a.parent().parent().parent('.dropdown')
      return unless dropdown.length
      val = $a.data('wysihtml5-command-value')
      if dropdown.data('wysihtml5-command-value') isnt val
        dropdown.data 'wysihtml5-command-value', val
        dropdown.find('.dropdown-toggle span')
          .text($a.text())
          .attr('class', $a.attr('class'))

  resetDropdownMenus: (menus) ->
    $.each menus, (id, menu) =>
      return unless menu
      $m = $(menu)
      return if $m.find('a.wysihtml5-command-active').length
      first = $m.find('a[data-wysihtml5-command]:first')
      @updateDropdownMenus(first, $m)

  getScrollable: (elem) ->
    isWin = not elem.nodeName
    isWin ||= $.inArray(elem.nodeName.toLowerCase(), ['iframe', '#document', 'html', 'body']) isnt -1
    return elem unless isWin
    doc = (elem.contentWindow or elem).document or elem.ownerDocument or elem
    if /webkit/i.test(navigator.userAgent) or doc.compatMode == 'BackCompat'
      doc.body
    else
      doc.documentElement

  # Dynamically expand and contract editor to content size
  getRange: (iframe) ->
    win = iframe.contentWindow
    return null unless win
    doc = win.document
    sel = win.getSelection and win.getSelection()
    if sel and sel.getRangeAt and sel.rangeCount
      rng = sel.getRangeAt(0)
    else if doc.selection and doc.selection.createRange
      rng = doc.selection.createRange()
    rng and rng.endContainer or null

  initAutoResize: (options) ->
    return false if typeof ($('body')[0].scrollHeight) is 'undefined' or not @editor.composer

    options = options or {}
    resizeFunc = (evt) => @resize(evt)

    # Cache vars for performance
    c = @_resize = options: options or {}
    c.$iframe = $(@editor.composer.iframe)
    c.$body = c.$iframe.contents().find('body')
    c.minHeight = c.$iframe.height()
    c.$scrollElem = $(@getScrollable(window))
    c.topPadding = options.paddingTop or ((parseInt(c.$scrollElem.css('padding-top')) or 0) + 30)

    c.$iframe.addClass('wysihtml5-auto-resizable').attr 'scrolling', 'no'
    c.$body.addClass 'wysihtml5-auto-resizable'

    c.$body.on 'keyup', _.debounce(resizeFunc, 250)
    c.$body.on 'keydown', (evt) ->
      resizeFunc evt if evt.keyCode is wysihtml5.ENTER_KEY
    c.$body.on 'focus', resizeFunc
    c.$body.on 'paste', (evt) ->
      imagesLoaded c.$iframe[0], resizeFunc
      resizeFunc evt
    @editor.on 'aftercommand:composer', resizeFunc
    imagesLoaded c.$iframe[0], resizeFunc

    # Monkey patch insertImage.exec to monitor image loading
    @_insertImageExec ||= wysihtml5.commands.insertImage.exec
    self = this
    wysihtml5.commands.insertImage.exec = (args...) ->
      self._insertImageExec.apply(this, args)
      imagesLoaded c.$iframe[0], resizeFunc

    # Remove the height style attribute from wysihtml5 focus and blur clones.
    # This prevents wysihtml5 from resetting the height.
    setTimeout =>
      @removeStyle($(@editor.composer.focusStylesHost), 'height')
      @removeStyle($(@editor.composer.blurStylesHost), 'height')
    , 1

    @resize $.Event('load')


  removeStyle: ($el, attr) ->
    re = new RegExp ";\\s*#{attr}:[^;]*;\\s*", 'g'
    $el.attr 'style', $el.attr('style').replace(re, '; ')

  isAutoResizeEnabled: ->
    !!@_resize

  isKeyEvent: (evt) ->
    evt.type == 'keyup' or evt.type == 'keydown' or evt.type == 'paste'

  resize: (evt) ->
    # Delay resize to make sure dom has updated
    unless evt instanceof $.Event
      return setTimeout (=> @resize $.Event('delayed')), 20

    c = @_resize
    $range = $(@getRange c.$iframe[0])

    # Use parent of text node
    $range = $range.parent() if $range.length and $range[0].nodeType == 3

    # Check for DELETE keys
    if evt.type is 'keyup' and (evt.keyCode == wysihtml5.BACKSPACE_KEY or evt.keyCode == wysihtml5.DELETE_KEY)
      $range.nextAll().find('br:only-child').parent().remove()
      deletedHeight = c.$iframe.height()
      c.$iframe.height c.minHeight # Force recalc of scrollHeight
    height = c.$iframe.height()
    scrollHeight = c.$body[0].scrollHeight

    # Adjust iframe height if needed
    if scrollHeight > c.minHeight and height < scrollHeight
      c.$iframe.height scrollHeight
      @resizeScroll $range, scrollHeight, height, deletedHeight, evt

  resizeScroll: ($range, scrollHeight, height, deletedHeight, evt) ->
    c = @_resize

    # Only scroll if cursor is at the bottom and user is typing
    seHeight = c.$scrollElem.height()
    seTop = c.$scrollElem.scrollTop()
    raTop = $range.length and $range.offset().top or 0
    fTop = c.$iframe.offset().top
    belowthefold = seHeight + seTop < fTop + raTop
    abovethetop = seTop > fTop + scrollHeight - c.topPadding
    newTop = seTop

    # Scroll up if deleting and caret is above viewport
    if deletedHeight and abovethetop
      newTop = seTop + scrollHeight - deletedHeight

    # Scroll down if caret is below viewport or user is interacting with the editor
    else if belowthefold or !deletedHeight and @isKeyEvent(evt)
      newTop = seTop + scrollHeight - height

    # Only scroll if needed
    c.$scrollElem.scrollTop newTop if seTop isnt newTop


# these define our public api
methods =
  bypassDefaults: (options) ->
    @each ->
      $this = $(this)
      $this.data 'wysihtml5', new Wysihtml5($this, options)

  shallowExtend: (options) ->
    settings = $.extend({}, methods.defaults(), options or {}, $(this).data())
    that = this
    methods.bypassDefaults.apply that, [settings]

  deepExtend: (options) ->
    settings = $.extend(true, {}, methods.defaults(), options or {})
    that = this
    methods.bypassDefaults.apply that, [settings]

  defaults: ->
    wysihtml5.defaults.templates ||= wysihtml5.toolbarTemplates
    wysihtml5.defaults

  init: (options) ->
    that = this
    methods.shallowExtend.apply that, [options]


$.fn.wysihtml5 = (args...) ->
  method = args.length && args[0] || null
  if methods[method]
    methods[method].apply this, Array::slice.call(args, 1)
  else if typeof method is 'object' or not method
    methods.init.apply this, args
  else
    $.error 'Method ' + method + ' does not exist on jQuery.wysihtml5'

$.fn.wysihtml5.locale = {}
$.fn.wysihtml5.Constructor = Wysihtml5


