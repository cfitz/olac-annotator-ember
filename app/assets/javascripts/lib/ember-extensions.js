Em.TextField.reopen({
  attributeBindings: ['required']
});


Em.Select.reopen({
  attributeBindings: ['required']
});


// 
// App.ErrorMixin = Ember.Mixin.create({
//     classNameBindings: ['isError:error'],
//     errorBinding: 'parentView.error',
// 
//     template: Ember.Handlebars.compile('{{#if isError}}{{errorMessage}}{{/if}}'),
// 
//     isError: function() {
//         var error = this.get('error');
//         return error && error.isError(this.get('propertyName'));
//     }.property('error', 'propertyName'),
// 
//     errorMessage: function() {
//         var error = this.get('error');
//         if (error) {
//             var propertyName = this.get('propertyName');
//             return error.getErrorMessage(propertyName);
//         }
//     }.property('error', 'propertyName')
// });
// 
// App.TextField = Ember.TextField.extend(App.ErrorMixin);


// Ember.Application.reopen({
//     AlphaNumField:  Ember.TextField.extend({
//         isError: function() {
//             return /^[a-z0-9]+$/i.test(this.get('value'));
//         }.property('value'),
//         
//         classNameBindings: 'isValid:valid:invalid'
//     })
// });