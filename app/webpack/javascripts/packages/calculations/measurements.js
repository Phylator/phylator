import $ from 'jquery';
window.jQuery = window.$ = $;

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.calculations.measurements')) {
        require('jquery-flexdatalist/jquery.flexdatalist');
        init();
    }
})

function addMeasurement(data) {
    let el = document.querySelector('p#measurement-index'),
        index = parseInt(el.innerHTML);
    data = data.replace(index, index + 1);
    el.innerHTML = index + 1;
    $('.measurement').last().after(data);
}
window.addMeasurement = addMeasurement;

function init() {
    document.querySelectorAll('input.select--initial').forEach( (element) => {
        $(element).flexdatalist( 'value', element.dataset.value );
    })
    $('input.select--initial').one( 'change:flexdatalist', function( event, set, options ) {
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
