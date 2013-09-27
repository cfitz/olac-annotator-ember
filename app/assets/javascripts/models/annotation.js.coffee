App.Annotation = DS.Model.extend(
  name: DS.attr("string")
  canonical_name: DS.attr("string")
  role: DS.attr("string")
  role_language: DS.attr("string")
  role_translation: DS.attr('string')
  approved: DS.attr("boolean")
  note: DS.belongsTo('App.Note')
  comment: DS.attr("string")
  didCreate: ->
    note = this.get('note')
    note.set('updatedAnnotation', true)
  isRoleLanguageEnglish: (->
    this.get('role_language') ==  "english"
  ).property('role_language')
)

