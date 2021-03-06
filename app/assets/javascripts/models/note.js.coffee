App.Note = DS.Model.extend(
  input_field: DS.attr("string")
  record_title: DS.attr('string')
  text: DS.attr('string')
  approved_counter: DS.attr('number')
  language: DS.attr('string')
  marc_language: DS.attr('string')
  annotations: DS.hasMany('App.Annotation')
  record: DS.belongsTo("App.Record")
  authority_names: DS.attr('array')
  updatedAnnotation: false
  marc_language_upped: (->
    lang = this.get('marc_language')
    return "" if not lang?
    return lang.charAt(0).toUpperCase() + lang.slice(1)
  ).property('marc_language')
  
)
