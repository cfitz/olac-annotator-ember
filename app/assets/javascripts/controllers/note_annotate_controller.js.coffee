App.NoteAnnotateController = Ember.ObjectController.extend({
  needs: [ 'notesRandom' ]
  isNoteInvalid: true
  startAnnotating: () ->
    note = this.get('model')    
    transaction = note.get('store').transaction()
    transaction.add(note)
    transaction.add(note.get('annotations').createRecord())
    this.transaction = transaction

  skip: () ->
    if this.transaction
      this.transaction.rollback();
      this.transaction = null;
    notesRandomController = this.get('controllers.notesRandom')
    notesRandomController.getRandom(this.get('model.language'))
   
  save: () ->
    this.transaction.commit()
    notesRandomController = this.get('controllers.notesRandom')
    notesRandomController.getRandom(this.get('model.language'))
  
  addAnnotation: () ->
    this.get('model.annotations').createRecord()
    
  updateStatus: (status) ->
    console.log "UPDATE  " + status
    this.set('isNoteInvalid', status)
    
  
})