App.LanguageOfRoleOrFunctionContainer = Ember.View.extend({
  templateName: 'annotate_language_change'
  roleLang:  null
  didInsertElement: ->
    @.set('roleLang', @.get('controller.roleLang'))
});