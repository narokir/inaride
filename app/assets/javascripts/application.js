// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
// 
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.ui.core
//= require jquery.ui.effect-slide
//= require bootstrap.js
//= require_tree .
$(document).ready(function(){
  
  // add datepicker to date form fields
  $(function() {
    $('#ride_date').datepicker({dateFormat: 'yy-mm-dd'});
  });
  
  // validate form wizards with jQuery validation plugin
  $("form").validate();
  
  // Bootstrap tooltip settings
  $('.tooltip-left').tooltip({placement:'left'});
  $('.tooltip-right').tooltip({placement:'right'});
  $('.tooltip-top').tooltip({placement:'top'});
  $('.tooltip-bottom').tooltip({placement:'bottom'});
  $('.has-popover').popover({placement:'right',trigger: 'focus'});
  $(".collapse").collapse({ toggle: true });
  
  //Replace placeholder on inputs
  $('#ride_origin').blur(function() {
    $(this).prop("placeholder","From:")
  });
  $('#ride_origin').focus(function() {
      $(this).prop("placeholder","")
  });
  $('#ride_date').blur(function() {
    $(this).prop("placeholder","Date:")
  });
  $('#ride_date').focus(function() {
    $(this).prop("placeholder","")
  });
  $('#ride_destination').blur(function() {
    $(this).prop("placeholder","To:")
  });
  $('#ride_destination').focus(function() {
    $(this).prop("placeholder","")
  });
    
});

