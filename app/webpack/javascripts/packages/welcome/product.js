import $ from 'jquery';
import AOS from 'aos';

export function init() {
    AOS.init();
};

export function scroll() {
    $('.continue').click(function() {
        $('html, body').animate({
            scrollTop: $('.continue').offset().top + 75
        }, 1000);
    });
};
