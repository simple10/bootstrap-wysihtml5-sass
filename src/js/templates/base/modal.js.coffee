# Modal base class.
#
# Extend and override @tpl and @insert.
class window.wysihtml5.ToolbarTemplatesModal extends window.wysihtml5.ToolbarTemplatesBase
  # Override
  tpl: ''
  inputsSelector: 'input'
  caretBookmark: null

  init: ->
    @$modal = @$tpl.find('.modal')
    $inputs = @$modal.find(@inputsSelector)

    @$modal.on 'shown.bs.modal', ->
      $inputs.first().focus()

    @$modal.find('a.btn-primary').click (e) =>
      unless @_insert()
        e.preventDefault()
        e.stopPropagation()

    $inputs.keypress (e) =>
      if e.which is 13 # ENTER
        e.preventDefault()
        if @_insert()
          @$modal.modal 'hide'

    @$modal.on 'hide.bs.modal', =>
      @wysi.editor.currentView.element.focus()

    # Prevent normal propagation on dismis modal so focus can be restored to editor
    @$modal.on 'click.dismiss.modal', '[data-dismiss="modal"]', (e) ->
      e.stopPropagation()

    @$tpl.find('a[data-wysihtml5-command]').click =>
      if $(this).hasClass('wysihtml5-command-active')
        true
      else
        @openModal()
        false

    @$tpl

  # Override
  insert: ->
    console.log('Modal.insert should be overridden in subclass')

  # Wrap call to @insert
  _insert: ->
    if @insert()
      @$modal.find(@inputsSelector).val('')
      if @caretBookmark
        @wysi.editor.composer.selection.setBookmark @caretBookmark
        @caretBookmark = null
      @wysi.editor.currentView.element.focus()
      true
    else
      false

  openModal: ->
    @wysi.editor.currentView.element.focus false
    @caretBookmark = @wysi.editor.composer.selection.getBookmark()
    @$modal.modal 'show'
