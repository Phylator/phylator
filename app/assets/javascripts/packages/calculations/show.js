document.addEventListener( 'turbolinks:load', function() {
    calculationsShowInit();
});



function calculationsShowInit() {
    $('body.calculations.show').click(function() {
        $('.account-wrapper').removeClass('invisible');
    });

    // $('body.calculations.show input.flexdatalist').on( 'flexdatalist:change', function() {
    $('body.calculations.show input.flexdatalist').change(function() {
        $(this).closest('form').submit();
    });
};
