App.Router.map ->
  this.route("about", { path: "/about" })
  this.route("credits", { path: "/credits" })
  this.resource('record', {path: 'record/:record_id'})
  this.resource("notes", () -> 
    this.route('random', { path: 'random/:language' }))
  this.resource('note', { path: 'note/:note_id' }, () ->
    this.route('annotate'))