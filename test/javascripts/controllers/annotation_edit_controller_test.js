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

test("return role warning", function() { 
  var annotationEditController = this.annotationEditController;
  annotationEditController.set('role', "directory");
  equal(annotationEditController.checkWarnings('role'), false);
  annotationEditController.set('role', "director and producer");
  equal(annotationEditController.checkWarnings('role'), true);
  annotationEditController.set('role', "director & producer");
  equal(annotationEditController.checkWarnings('role'), true);
  annotationEditController.set('role', "director + producer");
  equal(annotationEditController.checkWarnings('role'), true);
  annotationEditController.set('role', "director / producer");
  equal(annotationEditController.checkWarnings('role'), true);
  annotationEditController.set('role', "director , producer");
  equal(annotationEditController.checkWarnings('role'), true);
 



});

