App.LanguageOfRoleOrFunctionContainer = Ember.ContainerView.extend({
    childViews: ['guessedValue','changeValue']
    changeValue: Ember.View.create( templateName: 'annotate_language_change')
    guessedValue: Ember.View.create(
      roleLang:  null
      template: Ember.Handlebars.compile("<h3>{{#if view.roleLang }}We think this film or video is in {{ view.roleLang }}. {{else}} Please select a language {{/if}} </h3> ")
      didInsertElement: ->
        @.set('roleLang', @.get('controller.roleLang'))
    )        
});