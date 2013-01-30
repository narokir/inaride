// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
// 
//= require jquery
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
  // Turn forms into wizards with jQury quickWizard plugin
  $('#new_ride').quickWizard({
    prevButton : '<button type="button" class="btn btn-large">Previous</button>',
    nextButton : '<button type="button" class="btn btn-large">Next</button>',
    nextArgs : ["slide", { direction: "left" }, 500],
    PrevArgs : ["slide", { direction: "right" }, 500],
    submit : "#login" || "post_ride"
  });
  
    $('.tooltip-left').tooltip({placement:'left'});
    $('.tooltip-right').tooltip({placement:'right'});
    $('.tooltip-top').tooltip({placement:'top'});
    $('.tooltip-bottom').tooltip({placement:'bottom'});
    $('.has-popover').popover({placement:'right',trigger: 'focus'});
    $(".collapse").collapse({ toggle: true });
    
    //Replace placeholder on inputs
    $('#ride_origin').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","From:")
    });
    $('#ride_origin').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });
    $('#ride_date').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","Date:")
    });
    $('#ride_date').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });
    $('#ride_destination').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","To:")
    });
    $('#ride_destination').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });
    
});

