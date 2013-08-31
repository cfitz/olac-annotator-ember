App.NotesRandomRoute = Ember.Route.extend({
  model: (params) -> 
    params.language # this is a hack to just ahve the model be the language param
  setupController: (controller, model) ->
    controller.getRandom(model)

      
    
  
})