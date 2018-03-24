import $ from 'jquery';
window.jQuery = window.$ = $;
require('jquery-flexdatalist/jquery.flexdatalist');

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.calculations.enter')) {
        $('input.flexdatalist').on( 'change:flexdatalist', function( event, set, options ) {
            let quantityEl = this,
                unitEl = document.querySelector(quantityEl.dataset.units);
            if (unitEl && quantityEl.value) {
                let unitsUrl = '/app/quantities/' + set.value + '/units_of_measurement.json?locale=' + document.querySelector('html').getAttribute('lang');
                unitEl.dataset.data = unitsUrl;
                unitEl.disabled = false;
                $(unitEl).flexdatalist();
            }
        });
    }
})
