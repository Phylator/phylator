import $ from 'jquery';

export function init() {
    $('body.calculations.show').click(function() {
        $('.account-wrapper').removeClass('invisible');
    });

    // $('body.calculations.show input.flexdatalist').on( 'flexdatalist:change', function() {
    $('body.calculations.show input.flexdatalist').change(function() {
        $(this).closest('form').submit();
    });
};
