document.addEventListener( 'turbolinks:load', function() {
    calculationsShowInit();
});



function calculationsShowInit() {
    $('body').click(function() {
        $('.account-wrapper').removeClass('invisible');
    });
};
