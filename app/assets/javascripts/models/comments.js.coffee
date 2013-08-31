App.Comment = DS.Model.extend(
  note: DS.belongsTo("App.Note")
  text: DS.attr('string')
  commentersName: DS.attr('string')
)