import $ from 'jquery';
window.jQuery = window.$ = $;
require('jquery-flexdatalist/jquery.flexdatalist');

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.calculations.new')) {
        $('input.select').on( 'change:flexdatalist', ( event, set, options ) => {
            if (unitEl.value && quantityEl.value) {
                document.querySelector('form input.myg-button').classList.remove('myg-button--disabled');
            }
        });
        $('input.flexdatalist').on( 'change:flexdatalist', ( event, set, options ) => {
            let unitEl = document.querySelector('#__unit'),
                quantityEl = document.querySelector('#__quantity');
            if (unitEl && quantityEl.value) {
                let unitsUrl = '/app/quantities/' + set.value + '/units_of_measurement.json?locale=' + document.querySelector('html').getAttribute('lang');
                unitEl.dataset.data = unitsUrl;
                unitEl.disabled = false;
                $(unitEl).flexdatalist();
            }
        });
    }
})
