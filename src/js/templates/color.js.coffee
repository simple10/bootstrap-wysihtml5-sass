class Color extends window.wysihtml5.ToolbarTemplatesBase
  tpl: ->
    "<li class='dropdown wysiwyg-colors'>
      <a class='#{@btnClass} dropdown-toggle' data-toggle='dropdown' href='#' tabindex='-1'>
      <span class='wysiwyg-color wysiwyg-color-1'></span>&nbsp;<b class='caret'></b>
      </a>
      <ul class='dropdown-menu'>
        <li><a class='wysiwyg-color wysiwyg-color-1' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='1'></a></li>
        <li><a class='wysiwyg-color wysiwyg-color-2' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='2'></a></li>
        <li><a class='wysiwyg-color wysiwyg-color-3' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='3'></a></li>
        <li><a class='wysiwyg-color wysiwyg-color-4' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='4'></a></li>
        <li><a class='wysiwyg-color wysiwyg-color-5' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='5'></a></li>
        <li><a class='wysiwyg-color wysiwyg-color-6' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='6'></a></li>
        <li><a class='wysiwyg-color wysiwyg-color-7' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='7'></a></li>
      </ul>
    </li>"

window.wysihtml5.toolbarTemplates.color = Color
