import MygSlide from 'myg-slide';

import $ from 'jquery';
window.jQuery = window.$ = $;
require('jquery-flexdatalist/jquery.flexdatalist');

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.calculations.new')) {
        let slideIndex = 0;
        const mygSlide = new MygSlide( document.querySelector('.myg-slide'), {
            prevNextButtons: false,
            pageDots: false,
            draggable: false
        });
        document.querySelectorAll('a.next').forEach( (element) => element.addEventListener( 'click', function() {
            if (!this.classList.contains('myg-button--disabled')) {
                slideIndex++;
                mygSlide.flickity.select(slideIndex);
            }
        }));
        $('input.select').on( 'change:flexdatalist', ( event, set, options ) => {
            document.querySelector('.carousel-cell:nth-child(' + (slideIndex + 1) + ') a.next').classList.remove('myg-button--disabled');
            let unitsEl = document.querySelector(document.querySelector('.carousel-cell:nth-child(' + (slideIndex + 1) + ') input.flexdatalist').dataset.units);
            if (unitsEl) {
                let unitsUrl = '/app/quantities/' + set.value + '/units_of_measurement.json?locale=' + document.querySelector('html').getAttribute('lang');
                unitsEl.dataset.data = unitsUrl;
                $(unitsEl).flexdatalist();
            }
        });
    }
})
