class Lists extends window.wysihtml5.ToolbarTemplatesBase
  tpl: ->
    "<li>
      <div class='btn-group'>
      <a class='#{@btnClass}' data-wysihtml5-command='insertUnorderedList' title='#{@i18n 'lists.unordered'}' tabindex='-1'><i class='glyphicon glyphicon-list'></i></a>
      <a class='#{@btnClass}' data-wysihtml5-command='insertOrderedList' title='#{@i18n 'lists.ordered'}' tabindex='-1'><i class='glyphicon glyphicon-th-list'></i></a>
      <a class='#{@btnClass}' data-wysihtml5-command='Outdent' title='#{@i18n 'lists.outdent'}' tabindex='-1'><i class='glyphicon glyphicon-indent-right'></i></a>
      <a class='#{@btnClass}' data-wysihtml5-command='Indent' title='#{@i18n 'lists.indent'}' tabindex='-1'><i class='glyphicon glyphicon-indent-left'></i></a>
      </div>
    </li>"

window.wysihtml5.toolbarTemplates.lists = Lists
