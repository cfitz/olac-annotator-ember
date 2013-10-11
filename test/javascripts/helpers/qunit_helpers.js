function integration(name) {
  module("Integration: " + name, {
    setup: function() {
      sinon.stub(App.ScrollingDOMMethods, "bindOnScroll");
      sinon.stub(App.ScrollingDOMMethods, "unbindOnScroll");
      Ember.run(App, App.advanceReadiness);
    },

    teardown: function() {
      App.reset();
      App.ScrollingDOMMethods.bindOnScroll.restore();
      App.ScrollingDOMMethods.unbindOnScroll.restore();
    }
  });
}

function controllerFor(controller, model) {
  var controller = App.__container__.lookup('controller:' + controller);
  if (model) { controller.set('model', model ); }
  return controller;
}

function asyncTestApp(text, func) {

  asyncTest(text, function () {

    var qunitContext = this;
    Ember.run(function () {
      func.call(qunitContext);
    });
  });
}