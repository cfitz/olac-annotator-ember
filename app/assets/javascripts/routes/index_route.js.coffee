App.IndexRoute = Ember.Route.extend({
  setupController: (controller) ->
    App.cameFromeHomepage = true
    controller.set('languages', [ { id: "english"}, {id: "spanish"}, {id: "german" } ]);
})