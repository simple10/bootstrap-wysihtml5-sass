class Emphasis extends window.wysihtml5.ToolbarTemplatesBase
  tpl: ->
    "<li>
      <div class='btn-group'>
      <a class='#{@btnClass}' data-wysihtml5-command='bold' title='CTRL+B' tabindex='-1'>#{@i18n 'emphasis.bold'}</a>
      <a class='#{@btnClass}' data-wysihtml5-command='italic' title='CTRL+I' tabindex='-1'>#{@i18n 'emphasis.italic'}</a>
      <a class='#{@btnClass}' data-wysihtml5-command='underline' title='CTRL+U' tabindex='-1'>#{@i18n 'emphasis.underline'}</a>
      </div>
    </li>"

window.wysihtml5.toolbarTemplates.emphasis = Emphasis
