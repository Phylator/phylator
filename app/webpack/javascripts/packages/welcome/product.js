import $ from 'jquery';

export function init() {
    $('.continue').click(function() {
        $('html, body').animate({
            scrollTop: $('.continue').offset().top + 75
        }, 1000);
    });
};
