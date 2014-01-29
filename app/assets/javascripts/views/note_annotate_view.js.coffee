App.CommentViewMaster =  Bootstrap.Forms.TextArea.extend({
  classNames: ["comment-master"]
  label: ""
  valueBinding: 'this.controller.commentOrProblem'
})

App.CommentViewSlave = Ember.TextField.extend({  
  classNames: ["comment-slave"]
  updateValue: (->
    controller = this.get('controller')   
    this.set('value',  controller.get('commentOrProblem') )
  ).observes('controller.commentOrProblem')

  didInsertElement: ->
    this.set('value', this.get('controller.commentOrProblem'))

})


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
  showMessage: true
  message: '<ol><li>Copy the words in the credit to the "name in credit" or "role or function in credit" boxes. </li><li> Some words may be left over. </li><li> Fill in the other boxes with additional information about the credit. </li><li> Click the instructions link in the upper right for more help.</li></ol>'
  updateMessage : (->
    counter = this.get('controller.savedCounter')
    if counter == 1
      message = "<h4 class='text-center'>You've annotated a record! Please continue.</h3>"
      this.showSuccess(message)
    if counter > 1 
      message = '<h4 class="text-center">' + this.get('controller.savedCounter') + ' records annotated.</h4>' 
      this.showSuccess(message)
  ).observes('controller.savedCounter')
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
          
