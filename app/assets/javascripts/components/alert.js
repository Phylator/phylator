document.addEventListener( 'turbolinks:load', function() {
    componentsAlertInit();
});



function componentsAlertInit() {
    var el = $('p#alert');

    if ( el.text().length > 0 ) {
        iziToast.error({
            title: el.text(),
            backgroundColor: '#ec626e'
        });
    };
};
