document.addEventListener( 'turbolinks:load', function() {
    if ($('body.welcome.product').length != 0) {
        welcomeProductInit();
        welcomeProductScroll();
    };
});



function welcomeProductInit() {
    AOS.init();
};

function welcomeProductScroll() {
    $('.continue').click(function() {
        $('html, body').animate({
            scrollTop: $('.continue').offset().top + 50
        }, 1000);
    });
};
