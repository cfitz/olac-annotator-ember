App.Annotation = DS.Model.extend(
  name: DS.attr("string")
  canonical_name: DS.attr("string")
  role: DS.attr("string")
  role_language: DS.attr("string")
  approved: DS.attr("boolean")
  note: DS.belongsTo('App.Note')

  isRoleLanguageEnglish: (->
    this.get('role_language') ==  "english"
  ).property('role_language')
)

