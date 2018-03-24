import MygSlide from 'myg-slide';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    if (!document.querySelector('body.calculations.new')) {
        const mygSlides = MygSlide.initAll( document.querySelectorAll('.myg-slide'), {
            prevNextButtons: false,
            wrapAround: true,
            autoPlay: 10000
        });
    }
}
