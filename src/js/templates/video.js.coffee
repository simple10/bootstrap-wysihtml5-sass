class Video extends window.wysihtml5.ToolbarTemplatesModal
  tpl: ->
    "<li>
      <div class='modal fade' tabindex='-1' role='dialog' aria-hidden='true' aria-labelledby='wysimodal-label-video'>
      <div class='modal-dialog'>
        <div class='modal-content'>
        <div class='modal-header'>
          <a class='close' data-dismiss='modal' aria-hidden='true'>&times;</a>
          <h3 class='modal-title' id='wysimodal-label-video'>#{@i18n 'video.insert'}</h3>
        </div>
        <div class='modal-body'>
          <input name='videourl' type='url' placeholder='#{@i18n 'video.placeholder'}' class='form-control'>
        </div>
        <div class='modal-footer'>
          <a href='#' class='btn btn-default' data-dismiss='modal'>#{@i18n 'video.cancel'}</a>
          <a href='#' class='btn btn-primary' data-dismiss='modal'>#{@i18n 'video.insert'}</a>
        </div>
        </div>
      </div>
      </div>
      <a class='#{@btnClass}' data-wysihtml5-command='insertImage' title='#{@i18n 'video.insert'}' tabindex='-1'><i class='glyphicon glyphicon-play'></i></a>
    </li>"

  insert: ->
    url = @$modal.find('input[name=videourl]').val()
    parts = @validateURL(url)
    unless parts
      # todo: show error
      alert('invalid url')
      return false
    url = switch parts[1]
      when 'youtube' then "//www.youtube-nocookie.com/embed/#{parts[2]}"
      when 'vimeo' then "//player.vimeo.com/video/#{parts[2]}?badge=0&portrait=0&byline=0"
    @wysi.editor.composer.commands.exec "insertVideo", src: url, width: '560', height: '315'
    true

  validURLs: [
    /\/\/www.(youtube).com\/watch\?v=([^&]+)/
    /\/\/(vimeo).com\/([^\?\/]+)/
  ]

  validateURL: (url) ->
    for test in @validURLs
      matches = url.match(test)
      return matches if matches


window.wysihtml5.toolbarTemplates.video = Video

wysihtml5 = window.wysihtml5

NODE_NAME = "IFRAME"
wysihtml5.commands.insertVideo =
  # @example
  # wysihtml5.commands.insertVideo.exec(composer, 'insertVideo', 'http://www.youtube.com/embed/Hx_rRirV2vc');
  # wysihtml5.commands.insertVideo.exec(composer, 'insertVideo', { src: 'http://www.youtube.com/embed/Hx_rRirV2vc', width: '560', height: '315' });
  exec: (composer, command, value) ->
    value = (if typeof (value) is "object" then value else src: value)
    doc = composer.doc
    video = @state(composer)

    if video
      # Video already selected, set the caret before it and delete it
      composer.selection.setBefore video
      parent = video.parentNode
      parent.removeChild video

      # and it's parent <a> too if it hasn't got any other relevant child nodes
      wysihtml5.dom.removeEmptyTextNodes parent
      if parent.nodeName is 'A' and not parent.firstChild
        composer.selection.setAfter parent
        parent.parentNode.removeChild parent

      # firefox and ie sometimes don't remove the video handles, even though the video was removed
      wysihtml5.quirks.redraw composer.element
      return

    attrs = for k, v of value
      "#{k}='#{v}'"
    tpl = composer.parent.parse("<div class='wysiwyg-object-container'><iframe #{attrs.join(' ')}></iframe></div><p><br></p>")
    video = $(tpl)[0]

    composer.selection.insertNode video
    if wysihtml5.browser.hasProblemsSettingCaretAfterImg()
      textNode = doc.createTextNode(wysihtml5.INVISIBLE_SPACE)
      composer.selection.insertNode textNode
      composer.selection.setAfter textNode
    else
      composer.selection.setAfter video

  state: (composer) ->
    doc = composer.doc
    return false unless wysihtml5.dom.hasElementWithTagName(doc, NODE_NAME) &&
      selectedNode = composer.selection.getSelectedNode(doc)

    # This works perfectly in IE
    return selectedNode if selectedNode.nodeName is NODE_NAME

    return false if selectedNode.nodeType isnt wysihtml5.ELEMENT_NODE

    text = composer.selection.getText()
    text = wysihtml5.lang.string(text).trim()
    return false if text

    videosInSelection = composer.selection.getNodes(doc, wysihtml5.ELEMENT_NODE, (node) ->
      node.nodeName is NODE_NAME
    )
    return false if videosInSelection.length isnt 1
    videosInSelection[0]


