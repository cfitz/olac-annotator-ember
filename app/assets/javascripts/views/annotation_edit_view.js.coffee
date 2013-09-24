# This is a slave text field. it simply watches the roleLang value and updates itself. 
App.LanguageOfRoleOrFunctionSlave = Ember.TextField.extend({  
  updateValue: (->
    controller = this.get('controller.parentController')   
    this.set('value',  controller.get('roleLanguage') )
  ).observes('controller.parentController.roleLanguage')

  # set the value of the slave to whatever the current roleLang vlaue is
  didInsertElement: ->
    this.set('value', this.get('controller.parentController.roleLanguage'))
   
})

# this is  the master pulldown, which updates the roleLang value which updates the slaves
App.LanguageOfRoleOrFunctionMaster = Ember.Select.extend({
  attributeBindings: ['required', "errorMessage"]
  classNames: 'language-pulldown required input-large'
  errorMessage: "This field is required. Please select a value."
  contentBinding: "App.languages" 
  optionValuePath: "content.value"
  optionLabelPath: "content.label"
  valueBinding: "controller.roleLanguage"
  prompt: "--Select--"
  didInsertElement: ->
    this.insertPopover()
    $("##{this.get('elementId')}").popover('hide') 

  showPopup: (->
    error = this.get('controller.roleLanguageError') 
    if error == true  ## sloppy. need to bind this to controller too    
        $("##{this.get('elementId')}").popover('show') 
    else
        $("##{this.get('elementId')}").popover('hide') 
  ).observes('controller.roleLanguageError')
  insertPopover: () ->
     $("##{this.get('elementId')}").popover(
       trigger: "manual"
       placement: "top"
       content: this.get("errorMessage")
       html: true
       title: "LANGUAGE OF ROLE ERROR <div class=\"popover-destroy\">x</div> "
     )
})


App.ValidateAgainstField = Ember.TextField.extend({
  attributeBindings: ['required', "field", "errorMessage" ]
  didInsertElement: ->
    cont = this.get('controller')
    cont['setError']("name", true)
    cont['setError']("role", false)
    this.insertPopover()
    this.insertWarning()
    $('form').on("click",".popover",  ( => $(".popover").hide() ))
  focusOut: (event) ->
    controller = this.get('controller')
    validation = controller["validateAgainstCredit"](this.field,  this.required  )
    warning = controller["checkWarnings"](this.field)
    this.popover(!validation) # if validation is false, we show the popover. else hide it.
    this.showWarning(warning)
  showWarning: ( doShow) ->
    cmd = if doShow == true then "show" else "hide"
    $("##{this.get('elementId')}").parent().popover(cmd)
  insertWarning: () ->
    $("##{this.get('elementId')}").parent().popover(
      trigger: "manual"
      placement: "right"
      content: "If there is more than one role or function in the credit, use the 'Add a new line for another name or role” link to make a new line, repeat the name and put each role or function in its own box. For example, 'produced and directed by Jane Jones and Sam Smith” should result in four lines: (1) 'Jane Jones” and 'produced by”; (2) 'Jane Jones” and 'directed by”; (3) 'Sam Smith” and 'produced by”; (4) 'Sam Smith” and 'directed by.”" 
      html: true
      title: "#{this.get('field').toUpperCase()} WARNING <div class=\"popover-destroy\">x</div> "
    )
  insertPopover: () ->
    $("##{this.get('elementId')}").popover(
      trigger: "manual"
      placement: "top"
      content: this.get("errorMessage")
      html: true
      title: "#{this.get('field').toUpperCase()} ERROR <div class=\"popover-destroy\">x</div> "
    )
  popover: (doShow) ->
    cmd = if doShow == true then "show" else "hide"
    $("##{this.get('elementId')}").popover(cmd)
  keyUp: () ->
    klass = ".#{this.field}-in-credit"
    newClass = klass.replace(".", "highlight-")
    $("#random_interest").unhighlight({ element: 'em', className: newClass })
    $.each $(klass), (index, value) ->
      texts = this.value.split " "
      for text in texts
        text_check = ".high-lit:contains('#{text}')"
        $("#random_interest").highlight(RegExp.escape(text), { element: 'em', className: newClass + " high-lit" }) unless $(text_check).length > 0


  
})
    
App.AnnotationEditsView = Ember.View.extend({
  templateName: 'annotations'
  marc_language: null
  updateLangGuess: ->
    true
  didInsertElement: ->
    this.set('marc_language',  )

 
})

App.AnnotationEditView = Ember.View.extend({
  templateName: 'annotation'
  authority_names: null
  didInsertElement: ->
    $('.popover').hide()
    $(".annon_tooltip").tooltip()
    $('annon_warning_tooltip').tooltip()
    auth_names = [ Ember.Object.create({ name: "No matching name in list" }) ]
    auth_names.push(name) for name in this.get('controller.model.note.authority_names')
    this.set('authority_names', auth_names)  
})
