modalPaneTemplate = [
  '<div class="modal-header">',
  '  <a href="#" class="close" rel="close">&times;</a>',
  '  {{view view.headerViewClass}}',
  '</div>',
  '<div class="modal-body">',
  ' {{ view Bootstrap.Forms.TextField valueBinding="view.newComment.commentersName" label="Your Name:"  }}'
  ' {{ view  Bootstrap.Forms.TextArea valueBinding="view.newComment.text" label="Comment:"  }}',
  '</div>',
  '<div class="modal-footer">',
  '  {{view view.footerViewClass}}',
  '</div>'].join("\n")


App.NoteAnnotateView = Ember.View.extend
  showMessage: false
  message: ""
  showSuccess: (text) ->
    this.set('message', text)
    this.set('showMessage', true)
  showCommentModal: ->
    parentView = this
    noteId = this.get('controller.model.id' )
    Bootstrap.ModalPane.popup
      parentView: parentView
      newComment:  App.Comment.createRecord(note_id: App.Note.find(noteId) , text: "")
      heading: "Comment on this Credit:"
      defaultTemplate:  Ember.Handlebars.compile(modalPaneTemplate)
      showBackdrop: true
      animateBackdropIn: {method: "fadeIn" }
      animateBackdropOut: {method: "fadeOut"}
      primary: "Submit"
      secondary: "Cancel"
      callback: (opts, event) ->
        if opts.primary
          this.newComment.save().then( this._triggerCallbackAndDestroy({ close: true }, event) ).then( this.get('parentView').showSuccess("Your comment has been submited."))
        if opts.secondary
          this._triggerCallbackAndDestroy({ close: true }, event)
          