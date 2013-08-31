App.NoteAnnotateRoute = Ember.Route.extend({   
  model: (params) -> 
    this.modelFor('note')
  events: ->
    willTransition: (transition) ->
      console.log "transed!"
  setupController: (controller,model) ->
    controller.set("model", model)
    controller.startAnnotating()
  renderTemplate: () ->
    this.render()
    this.render('annotationEdit', {
      outlet: 'arg',
    })
})
