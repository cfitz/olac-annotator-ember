App.AnnotationEditsController = Ember.ArrayController.extend({
  needs: [ 'annotationEdit', 'noteAnnotate' ]
  itemController: 'annotationEdit'
  roleLanguageError: true # we start off in error
  roleLangBinding: Ember.Binding.from('controllers.noteAnnotate.model.marc_language')

  content: []


  contentChanged: (->
    
    hasErrors = (item, index, array) ->
      return ( item.hasError() == true )
    
    recurseAndFindErrors = (controller) ->
      controller.some(hasErrors)

    roleLang = this.get('roleLang')
    doWeHaveAProblem = ( recurseAndFindErrors(this) || !roleLang? )
    
    noteAnnotateController =  this.get("controllers.noteAnnotate")
    this.set("controllers.noteAnnotate.isNoteInvalid", doWeHaveAProblem)
  ).observes( 'this.@each.nameError', 'this.@each.roleError', 'this.roleLanguageError' )
  

  validateLanguageOfRole: ( text ) ->
    isEmpty = !text?
    @.set("roleLanguageError", isEmpty) # text? returns true is content. 
    !isEmpty

});


App.AnnotationEditController = Ember.ObjectController.extend({
  needs: [ 'annotationEdits', 'noteAnnotate' ]
  
  removeAnnotation: (annotation) ->
    annotation.deleteRecord()
    
  
  hasError: ->
    roleError = this.get('roleError')
    nameError = this.get('nameError')
    ( nameError || roleError  )

  setError: (field, isError ) ->
    this.set("#{field}Error", isError)
  
  validateAgainstCredit: ( field, isRequired = false) ->
    words = @.get(field)
    words ||= ""
    words = words.replace("...", "")
    checkWords = words.split " "
    
    return this.setError(field, !isRequired ) if words.length < 1
   
    credit = " " + this.get('controllers.noteAnnotate.model.text') + " "
    
    searcher = (term) ->
      search = new RegExp("(\\W|\\s)" + RegExp.escape(term) + "(\\W|\\s)", "gi")
      return ( credit.search(search) >= 0 )
  
    foundInCredit = (term ) ->
      return ( searcher(term) == true )

    allTermsFoundInCredit = ( arrayOfTerms ) ->
        arrayOfTerms.every(foundInCredit)
    
    areTermsInCredit = allTermsFoundInCredit(checkWords)
    this.setError(field, !areTermsInCredit )
    areTermsInCredit


      
  
  
})