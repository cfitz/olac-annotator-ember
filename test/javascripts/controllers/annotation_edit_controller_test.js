var annotation = function(args) {
  return App.Annotation.create(_.merge({
    id: 1,
    can_delete: true,
    version: 1
  }, args || {}));
};

module("App.AnnotationEditController", {
  setup: function() {
    this.annotationEditController = controllerFor('annotationEdit', annotation );
  }
});

test("editingMode", function(){
  var annotationEditController = this.annotationEditController;
  equal(annotationEditController.commentOrProblem, null);
  equal(annotationEditController.roleWarning, false);
  equal(annotationEditController.hasError(), undefined);
  
});
