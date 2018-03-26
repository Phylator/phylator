import $ from 'jquery';
window.jQuery = window.$ = $;

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.calculations.new')) {
        require('jquery-flexdatalist/jquery.flexdatalist');
        let unitEl = document.querySelector('#__unit'),
            quantityEl = document.querySelector('#__quantity');
        $(quantityEl).flexdatalist();
        $('input.select').on( 'change:flexdatalist', ( event, set, options ) => {
            if (unitEl.value && quantityEl.value) {
                document.querySelector('form input.myg-button').classList.remove('myg-button--disabled');
            }
        });
        $('input.flexdatalist').on( 'change:flexdatalist', ( event, set, options ) => {
            if (unitEl && quantityEl.value) {
                let unitsUrl = '/app/quantities/' + set.value + '/units_of_measurement.json?locale=' + document.querySelector('html').getAttribute('lang');
                unitEl.dataset.data = unitsUrl;
                unitEl.disabled = false;
                $(unitEl).flexdatalist();
            }
        });
    }
})
