document.addEventListener( 'turbolinks:load', function() {
    componentsModalInit();
});



function componentsModalInit() {
    $('#modal').iziModal({
        width: '85%'
    });
    $('.md-trigger').click(function(event) {
        event.preventDefault();
        $('#modal').iziModal('open');
    });
};
