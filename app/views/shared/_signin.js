<script type="text/javascript">
$("#signinModal").modal({
    show:true,
    keyboard: false,
    backdrop: 'static'
    })

    $('#signinModal').on('hidden', function () {
    history.back();
    })
</script>