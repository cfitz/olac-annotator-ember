App.Note = DS.Model.extend(
  input_field: DS.attr("string")
  record_title: DS.attr('string')
  text: DS.attr('string')
  language: DS.attr('string')
  marc_language: DS.attr('string')
  annotations: DS.hasMany('App.Annotation')
  comments: DS.hasMany('App.Comment')
  record: DS.belongsTo("App.Record")
  authority_names: DS.attr('array')
  

  
)