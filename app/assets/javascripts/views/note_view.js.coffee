###
# Just sticking some default text values in here. Kind of lame.... Go to the bottom to see the actual View. 
#
###

instructions_modal = 
  """
      <h5>
      You will be presented with a credit from a film or video. The credit will include the name(s) of a person, some people or an organization or organizations. The credit may also describe the role(s) or function(s) the people or organizations played in creating the film or video, such as directing or producing.
      </h5>
      <ol>
      <li>If there is a role or function in the credit, identify the language that the statement about the role or function is in and select it from the "Language of role or function" dropdown list. If there is no role or function, select "no role or function specified."</li>
      <li>Copy one name from the credit into the "Name in credit" box.</li>
      <li>Look for the name you copied from the credit in the "Match for name in credit" dropdown list and select it if it's present.</li>
      <li>If there is a role or function in the credit, copy one role or function into the "Role or function in credit" box.</li>
      <li>Give a literal English translation of the role or function from the credit in the next box if it's not already in English.</li>
      <li>Use “add a new line” to make a row for each combination of name and role or function.</li>
      <li>Use the comments box to let us know about anything you're unsure about.</li>
      </ol>
      <h5>
      Three basic examples are below. Use these
      <a href="/examples.pdf" class="page-link" target="_blank">additional examples</a>
      as guidelines if you have a more complex credit statement, such as "produced by United Broadcasting Inc. for Channel 4."  Return to these instructions at any time by clicking on the orange instructions button in the upper right corner of the screen.
      </h5>
      <table class="table table-bordered">
      <tbody>
      <tr>
      <td>Credit:</td>
      <td colspan="3">Directed by Clint Eastwood</td>
      </tr>
      <tr>
      <td>Language of role or function:</td>
      <td colspan="3">English</td>
      </tr>
      <tr>
      <td>Name In Credit:</td>
      <td>Match for Name in Credit:</td>
      <td>Role in Credit:</td>
      <td>English Translation of Role:</td>
      </tr>
      <tr>
      <td>Clint Eastwood</td>
      <td>Eastwood, Clint</td>
      <td>Directed by</td>
      <td></td>
      </tr>
      </tbody>
      </table>
      <table class="table table-bordered">
      <tbody>
      <tr>
      <td>Credit:</td>
      <td colspan="3">written and directed by Samuel Fuller</td>
      </tr>
      <tr>
      <td>Language of role or function:</td>
      <td colspan="3">English</td>
      </tr>
      <tr>
      <td>Name In Credit:</td>
      <td>Match for Name in Credit:</td>
      <td>Role in Credit:</td>
      <td>English Translation of Role:</td>
      </tr>
      <tr>
      <td>Samuel Fuller</td>
      <td>Fuller, Samuel</td>
      <td>written by</td>
      <td></td>
      </tr>
      <tr>
      <td>Samuel Fuller</td>
      <td>Fuller, Samuel</td>
      <td>directed by</td>
      <td></td>
      </tr>
      </tbody>
      </table>
      <img src='/screen_shot.jpg'>

"""


contact_modal = 
  """
  Please contact  <a class="page-link" href="mailto:kelleym@uoregon.edu">kelleym@uoregon.edu</a> for more information.
"""

App.NoteView = Ember.View.extend
  newComment: ""
  buildModal: (heading, message ) ->
    Bootstrap.ModalPane.popup
      heading: heading
      message: message
      primary: "Close"
      showBackdrop: true
      animateBackdropIn: {method: "fadeIn" }
      animateBackdropOut: {method: "fadeOut"}
  showInstructionsModal: ->
    this.buildModal("Instructions", instructions_modal )
  showContactUsModal: ->
    this.buildModal("Contact Us", contact_modal)
  didInsertElement: -> 
    if App.cameFromeHomepage == true
      this.showInstructionsModal()
      App.cameFromeHomepage = false

      
