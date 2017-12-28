// document.addEventListener( 'turbolinks:load', function() {
//     flexdatalistInit();
// });
//
//
//
// function flexdatalistInit(el = $('body')) {
//
//     el.find('input.flexdatalist').flexdatalist();
//
//     el.find('input.flexdatalist[data-units]').on( 'change:flexdatalist', function(event, set, options) {
//         $($(this).data('units')).data( 'data', ( 'app/quantities/' + set.value + '/units_of_measurement.json?locale=' + $('p#lang').text() ) ).flexdatalist().attr('disabled', 'false');
//     });
//
// };
