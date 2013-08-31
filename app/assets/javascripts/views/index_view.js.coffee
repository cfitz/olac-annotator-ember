App.ApplicationView = Ember.View.extend
  
  showContactUsModal: ->
    Bootstrap.ModalPane.popup
      heading: 'Contact Us'
      message: 'Please contact  <a class="page-link" href="mailto:kelleym@uoregon.edu">kelleym@uoregon.edu</a> for more information.'
      primary: "Close"
      showBackdrop: true
      animateBackdropIn: {method: "fadeIn" }
      animateBackdropOut: {method: "fadeOut"}