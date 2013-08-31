buttonDropdownTemplate = [
  '<a {{bindAttr class="view.typeClass :btn :btn-primary :btn-info :btn-large :dropdown-toggle" }}  data-toggle="dropdown" href="#">',
  '{{view.label}}',
  '<span class="caret"></span>',
  '</a>',
  '<ul class="dropdown-menu" id="home-select">',
  '   {{#if view.items}}',
  '       {{#each item in view.items}}',
  '           <li class="text-left">{{#linkTo "notes.random" item.value }}{{ item.label}}{{/linkTo}}</li>',
  '       {{/each}}',
  '   {{/if}}',
  '</ul>'
].join("\n");

Bootstrap.LanguageButtonDropdown = Ember.View.extend(

  label: null
  items: []
  classNames: ['btn-group']
  defaultTemplate: Ember.Handlebars.compile(buttonDropdownTemplate)
  Item: Ember.View.extend(
    tagName: 'a'
    attributeBindings: ['href']
    template: Ember.Handlebars.compile('{{label}}')
    href: '#'

    click: ->

      item        = Ember.get(this, 'context')
      actionName  = Ember.get(item, 'actionName')
      controller  = Ember.get(this, 'controller')
      disabled    = Ember.get(item, 'disabled')

      return if disabled == true
      this.set("controller.cameFromHomepage", true)
      Ember.tryInvoke("records", "random", [item.value])
    

  )

)