$(document).ready(function(){
    //Replace placeholder on inputs
    $('#ride_origin').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","From:")
        //alert('Handler for .prop() called.');
    });
    $('#ride_origin').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });
    
    $('#ride_date').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","Date:")
        //alert('Handler for .prop() called.');
    });
    $('#ride_date').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });
    
    $('#ride_destination').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","To:")
        //alert('Handler for .prop() called.');
    });
    $('#ride_destination').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });

});
