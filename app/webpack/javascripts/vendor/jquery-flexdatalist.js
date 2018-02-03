import $ from 'jquery';
window.jQuery = window.$ = $;
require('jquery-flexdatalist/jquery.flexdatalist');

export function init(el) {

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
