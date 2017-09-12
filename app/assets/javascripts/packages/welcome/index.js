document.addEventListener( 'turbolinks:load', function() {
    welcomeIndexInit();
});



function welcomeIndexInit() {
    $('.slick').slick({ infinite: false, mobileFirst: true, dots: true, arrows: false });
};
