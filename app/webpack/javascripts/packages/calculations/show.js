import $ from 'jquery';
window.jQuery = window.$ = $;

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.calculations.show')) {
        require('../../vendor/jquery.flexdatalist');
        let form = document.querySelector('#unit-conversion');
        $('input.flexdatalist').on( 'change:flexdatalist', ( event, set, options ) => {
            form.submit();
        });
    }
})
