class Link extends window.wysihtml5.ToolbarTemplatesModal
  tpl: ->
    "<li>
      <div class='modal fade' tabindex='-1' role='dialog' aria-hidden='true' aria-labelledby='wysimodal-label-link'>
      <div class='modal-dialog'>
        <div class='modal-content'>
        <div class='modal-header'>
          <a class='close' data-dismiss='modal' aria-hidden='true'>&times;</a>
          <h3 class='modal-title' id='wysimodal-label-link'>#{@i18n 'link.insert'}</h3>
        </div>
        <div class='modal-body'>
          <input name='url' type='url' placeholder='http://' class='form-control'>
          <label class='checkbox'> <input name='target' type='checkbox' checked>#{@i18n 'link.target'}</label>
        </div>
        <div class='modal-footer'>
          <a href='#' class='btn btn-default' data-dismiss='modal'>#{@i18n 'link.cancel'}</a>
          <a href='#' class='btn btn-primary' data-dismiss='modal'>#{@i18n 'link.insert'}</a>
        </div>
        </div>
      </div>
      </div>
      <a class='#{@btnClass}' data-wysihtml5-command='createLink' title='#{@i18n 'link.insert'}' tabindex='-1'><i class='glyphicon glyphicon-share'></i></a>
    </li>"

  insert: ->
    newWin = @$modal.find('input[name=target]').prop('checked')
    @wysi.editor.composer.commands.exec 'createLink',
      href: @$modal.find('input[name=url]').val()
      target: newWin and '_blank' or '_self'
      rel: newWin and 'nofollow' or ''
    true

window.wysihtml5.toolbarTemplates.link = Link
