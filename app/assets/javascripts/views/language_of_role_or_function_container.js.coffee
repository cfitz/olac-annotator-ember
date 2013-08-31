App.GuessedValue = Ember.View.extend( 
  template: Ember.Handlebars.compile("<h3>We think this credit is {{ controller.roleLang }}. Please click here if you would like to change it.</h3> ")
  click: ->
    this.set('controller.roleLang', null)
    this.get('parentView').decideWhichView()
 )
 
App.ChangeValue =  Ember.View.extend( templateName: 'annotate_language_change')

App.LanguageOfRoleOrFunctionContainer = Ember.ContainerView.extend({
    changeValue: App.ChangeValue.extend()
    fooBinding: "this.controller.roleLang"
    guessedValue: App.GuessedValue.extend() 
    decideWhichView: (->
      marcLang = this.get('controller.roleLang')
      if marcLang?
          this.set('currentView', this.get('guessedValue').create() )
      else
          this.set('currentView', this.get('changeValue').create() )    
    ).observes('controller.roleLang')
    didInsertElement: ->
      this.decideWhichView()
     
      
        
        
});