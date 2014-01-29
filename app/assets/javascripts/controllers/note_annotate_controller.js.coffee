App.NoteAnnotateController = Ember.ObjectController.extend({
  needs: [ 'notesRandom', 'annotationEdits' ]
  recordNumber: 1
  savedCounter: 0
  language: 'english'
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
    note = this.get('model')
    number = note.get('approved_counter')
    note.set('approved_counter', number += 1 )
    language = this.get('model.language')
    this.set('language', language)
    savedCounter = this.get('savedCounter')
    this.set('savedCounter', savedCounter + 1 )
    this.transaction.commit()
  
  annotationUpdated: (->
    updated = this.get('model.updatedAnnotation')
    if updated == true
      notesRandomController = this.get('controllers.notesRandom')
      notesRandomController.getRandom(this.get('language'))
   ).observes('this.model.updatedAnnotation')
  
  addAnnotation: () ->
    this.get('model.annotations').createRecord()
    
  updateStatus: (status) ->
    this.set('isNoteInvalid', status)
    
  
})
