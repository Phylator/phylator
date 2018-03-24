import MygSlide from 'myg-slide';

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
    }
})
