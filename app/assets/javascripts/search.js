//$(document).ready(function() {
//    $('#ride_origin').change(function(event) {
//	//alert($(this).serialize());
//	var dataString = { origin: "Asheville, NC", destination: "Boston, MA" };
//	$.ajax({
//	    type: "POST",
//	    url: "/search",
//	    data: dataString
//	    }).done(function( data ) {
//		$("#results").html(data);
//	    });
//    });
//    
//});
//
//$(document).ajaxComplete(function() {
////alert( "Triggered ajaxComplete handler." );
//});
//
//$(document).ajaxSend(function() {
////alert( "Triggered ajaxSend handler." );
//});

$('.pac-container').mousedown(function() {
  alert('Handler for .mousedown() called.');
});

$(document).ready(function() {
  
  //$('input#s').hide();
  
  $("#main-search").submit(function(event) {
    /* stop form from submitting normally */
    event.preventDefault();
    /* get some values from elements on the page: */
    var $form = $( this ),
    params = $("#main-search").serialize();
    url = $form.attr( 'action' );
    /* Send the data using post */
    var posting = $.post( url, params );
    $("#current-rides").empty().html('<div class="alert alert-info"><img src="/assets/loading.gif" /></div>');
    /* Put the results in a div */
    posting.done(function( data ) {
      $("#current-rides").html(data);
    });
  });
  
});

$(document).ajaxStop(function() {
  //$(".alert alert-info").empty().html('finish');
});

$(document).ajaxStart(function() {
  //$("#current-rides").empty().html('<div class="alert alert-info"><img src="/assets/loading.gif" /></div>');
});






//$(document).ajaxStart(function() {
//$("#results").empty().html('<img src="/assets/loading.gif" />');
//});
//
//$(document).ready(function() {
//    
//  var start = document.getElementById('ride_origin');
//  var end = document.getElementById('ride_destination');
//  var origin = new google.maps.places.Autocomplete(start);
//  var destination = new google.maps.places.Autocomplete(end);
//  
//  //google.maps.event.addListener(origin, 'place_changed', function(event) {
//  $('#ride_origin').change(function(event) {
//    var originValue = $("#ride_origin").attr("value");
//    var dataString = { origin: originValue };
//    $.ajax({
//      type: "POST",
//      url: "/search",
//      data: dataString
//    }).done(function( data ) { 
//      $("#results").html(data);
//    });
//    
//    
//  });
//  
//});
