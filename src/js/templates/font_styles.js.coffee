class FontStyles extends window.wysihtml5.ToolbarTemplatesBase
  tpl: ->
    "<li class='dropdown'>
      <a class='#{@btnClass} dropdown-toggle' data-toggle='dropdown' href='#' tabindex='-1'>
      <i class='glyphicon glyphicon-font'></i>&nbsp;<span>#{@i18n 'font_styles.normal'}</span>&nbsp;<b class='caret'></b>
      </a>
      <ul class='dropdown-menu'>
      <li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='p'>#{@i18n 'font_styles.normal'}</a></li>
      <li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h1'>#{@i18n 'font_styles.h1'}</a></li>
      <li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h2'>#{@i18n 'font_styles.h2'}</a></li>
      <li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h3'>#{@i18n 'font_styles.h3'}</a></li>
      </ul>
    </li>"

window.wysihtml5.toolbarTemplates.font_styles = FontStyles
