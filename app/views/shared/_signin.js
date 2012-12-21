<script type="text/javascript">
$(window).load(function() {
$("#signinModal").modal({
    show:true,
    keyboard: false,
    backdrop: 'static'
    })

    $('#signinModal').on('hidden', function () {
    history.back();
    })

});
</script>