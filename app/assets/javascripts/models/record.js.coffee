App.Record = DS.Model.extend(
  language: DS.attr("string")
  title: DS.attr("string")
  notes: DS.hasMany('App.Note')
  authority_names: DS.attr("array")
)
