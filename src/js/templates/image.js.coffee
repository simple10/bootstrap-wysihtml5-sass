class Image extends window.wysihtml5.ToolbarTemplatesModal
  tpl: ->
    "<li>
      <div class='modal fade' tabindex='-1' role='dialog' aria-hidden='true' aria-labelledby='wysimodal-label-image'>
      <div class='modal-dialog'>
        <div class='modal-content'>
        <div class='modal-header'>
          <a class='close' data-dismiss='modal' aria-hidden='true'>&times;</a>
          <h3 class='modal-title' id='wysimodal-label-image'>#{@i18n 'image.insert'}</h3>
        </div>
        <div class='modal-body'>
          <input name='imageurl' type='url' placeholder='http://' class='form-control'>
        </div>
        <div class='modal-footer'>
          <a href='#' class='btn btn-default' data-dismiss='modal'>#{@i18n 'image.cancel'}</a>
          <a href='#' class='btn btn-primary' data-dismiss='modal'>#{@i18n 'image.insert'}</a>
        </div>
        </div>
      </div>
      </div>
      <a class='#{@btnClass}' data-wysihtml5-command='insertImage' title='#{@i18n 'image.insert'}' tabindex='-1'><i class='glyphicon glyphicon-picture'></i></a>
    </li>"

  insert: ->
    @wysi.editor.composer.commands.exec 'insertImage', @$modal.find('input[name=imageurl]').val()

window.wysihtml5.toolbarTemplates.image = Image
