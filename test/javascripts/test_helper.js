/*global count:true find:true document:true equal:true sinon:true */


//= require ../../app/assets/javascripts/application.js
//= require sinon-1.7.1
//= require sinon-qunit-1.0.0
//= require helpers/qunit_helpers
//= require helpers/assertions
//= require_tree .
//= require_self

// sinon settings
sinon.config = {
  injectIntoThis: true,
  injectInto: null,
  properties: ["spy", "stub", "mock", "clock", "sandbox"],
  useFakeTimers: false,
  useFakeServer: false
};

window.assetPath = function() {
  return null;
};

var oldAjax = $.ajax;
$.ajax = function() {
  console.error("App.Ajax called in test environment (" + arguments[0] + ")");
  return oldAjax.apply(this, arguments);
};

App.rootElement = '#ember-testing';
App.setupForTesting();
App.injectTestHelpers();


QUnit.testStart(function() {
  // Allow our tests to change site settings and have them reset before the next test
  App.SiteSettings = jQuery.extend(true, {}, App.SiteSettingsOriginal);
  App.BaseUri = "/";
  App.BaseUrl = "";
});
