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
    notesRandomController = this.get('controllers.notesRandom')
    notesRandomController.getRandom(this.get('model.language'))
    
  addAnnotation: () ->
    this.get('model.annotations').createRecord()
    
  updateStatus: (status) ->
    this.set('isNoteInvalid', status)
    
  
})
