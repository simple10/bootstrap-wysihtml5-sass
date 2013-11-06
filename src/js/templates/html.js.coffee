class Html extends window.wysihtml5.ToolbarTemplatesBase
  tpl: ->
    "<li>
      <div class='btn-group'>
      <a class='#{@btnClass}' data-wysihtml5-action='change_view' title='#{@i18n 'html.edit'}' tabindex='-1'><i class='glyphicon glyphicon-pencil'></i></a>
      </div>
    </li>"

  init: ->
    sel = 'a[data-wysihtml5-action="change_view"]'
    @$tpl.find(sel).click (e) =>
      # Set height of textarea to match editor.
      # Editor height may have changed due to auto resize or other events.
      $(@wysi.editor.composer.textarea.element).height $(@wysi.editor.composer.iframe).height()
      # Disable other toolbar buttons when editing html
      @wysi.toolbar.find('a.btn').not(sel).toggleClass 'disabled'

window.wysihtml5.toolbarTemplates.html = Html


