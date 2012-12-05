//$(document).ready(function(){
//    $("#sign_in").click(function(event){
//        $('#signinModal').modal('show')
//        event.preventDefault();
//    });
//});



$(Document).ready(function(){
    //Replace placeholder on inputs
    $('#origin').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","Origin")
        //alert('Handler for .prop() called.');
    });
    $('#origin').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });
    $('#destination').blur(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","Destination")
        //alert('Handler for .prop() called.');
    });
    $('#destination').focus(function() {
        //alert('Handler for .focus() called.');
        $(this).prop("placeholder","")
    });

})
