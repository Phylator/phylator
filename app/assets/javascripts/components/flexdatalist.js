document.addEventListener( 'turbolinks:load', function() {
    flexdatalistInit();
});



function flexdatalistInit(el) {

    el = el || $('body');

    el.find('input.flexdatalist').flexdatalist();

    el.find('input.flexdatalist[data-units]').on( 'change:flexdatalist', function( event, set, options ) {
        var unitsEl = $(this).data('units'),
            unitsUrl = 'app/quantities/' + set.value + '/units_of_measurement.json?locale=' + $('p#lang').text();
        $(unitsEl).data( 'data', unitsUrl );
        $(unitsEl).flexdatalist();
        $(unitsEl).attr( 'disabled', 'false' );
    });

};
