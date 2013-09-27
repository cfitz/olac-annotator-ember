App.NoteAnnotateController = Ember.ObjectController.extend({
  needs: [ 'notesRandom', 'annotationEdits' ]
  recordNumber: 1
  isNoteInvalid: true
  commentOrProblem: null
  startAnnotating: () ->
    note = this.get('model')
    transaction = note.get('store').transaction()
    transaction.add(note)
    transaction.add(note.get('annotations').createRecord())
    this.transaction = transaction

  skip: () ->
    recordNumber = this.get('recordNumber')
    this.set('recordNumber', recordNumber + 1 )
    if this.transaction
      this.transaction.rollback()
      this.transaction = null
    notesRandomController = this.get('controllers.notesRandom')
    notesRandomController.getRandom(this.get('model.language'))
   
  save: () ->
    if this.get('isNoteInvalid')  == true
      $('.icon-exclamation-sign').siblings('select').popover('show')
      $('.icon-exclamation-sign').siblings('input').popover('show')
    else
      this.commit()

  commit: () ->
    this.transaction.commit()
    thisController = this
    setTimeout (->
      notesRandomController = thisController.get('controllers.notesRandom')
      notesRandomController.getRandom(thisController.get('model.language'))
      recordNumber = thisController.get('recordNumber')
      thisController.set('recordNumber', recordNumber + 1)
    ), 250 
  addAnnotation: () ->
    this.get('model.annotations').createRecord()
    
  updateStatus: (status) ->
    this.set('isNoteInvalid', status)
    
  
})
