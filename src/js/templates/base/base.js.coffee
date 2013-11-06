# Base template class.
#
# Extend and override @tpl.
class window.wysihtml5.ToolbarTemplatesBase
  btnClass: 'btn btn-default'
  defaultLocale: 'en-US'

  # Override
  tpl: ->
    "<div class='@btnClass'>#{@i18n 'test.name'}</div>"

  constructor: (locale, options, wysi) ->
    @wysi = wysi
    @locale = locale
    @btnClass = options.toolbarBtnClass
    @$tpl = $(@tpl())
    @init() if typeof @init is 'function'
    this

  i18n: (key) ->
    keys = key.split('.')
    lc = $.fn.wysihtml5.locale
    lc[@locale] && @_i18n(lc[@locale], keys) ||
      lc[@defaultLocale] && @_i18n(lc[@defaultLocale], keys) ||
      ''

  _i18n: (locales, keys) ->
    lookup = locales[keys[0]]
    switch typeof lookup
      when 'string' then lookup
      when 'object' then @_i18n lookup, keys.slice(1)
      else false
