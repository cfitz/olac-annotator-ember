App.NotesRandomController = Ember.ObjectController.extend({
  needs: [ 'noteAnnotate' ]
  getRandom: (language) ->
    $('.well.interest').toggleClass('static')
    $('.language-of-role-inner').toggleClass('disabled')
    App.Note.find(random: true, language: language ).then( (result) =>
      this.transition(result.objectAt(0) )
    )
    
  transition: (note) ->
    $('.well.interest').toggleClass('static') 
    $('.language-of-role-inner').toggleClass('disabled')
    @.set('controllers.noteAnnotate.commentOrProblem', null)
    this.transitionToRoute('note.annotate', note )   
    @get('stateManager').transitionTo('loaded.saved') 

  
})
