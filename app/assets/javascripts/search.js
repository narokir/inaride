$('.pac-container').mousedown(function() {
  alert('Handler for .mousedown() called.');
});


$(document).ready(function() {
    
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
    $("#ride_origin").css('<div class="alert alert-info"><img src="/assets/loading.gif" /></div>');
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

