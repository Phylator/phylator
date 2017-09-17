document.addEventListener( 'turbolinks:load', function() {
    iframeInit();
});



function iframeInit() {

    if ( inIframe() === true ) {
        $('body').addClass('disabledTransitions');
        $(':root').css( 'font-size': '18px' );
        $('body').removeClass('disabledTransitions');
    };

};

function inIframe() {
    try {
        return window.self !== window.top;
    } catch (e) {
        return true;
    }
}
