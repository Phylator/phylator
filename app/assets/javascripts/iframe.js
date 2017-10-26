document.addEventListener( 'turbolinks:load', function() {
    iframeInit();
});



function iframeInit() {

    var inIframe = ( window.location != window.parent.location ) ? true : false;

    if ( inIframe === true && $('body#scaling-custom').length != 0 ) {
        $('body').addClass('disabledTransitions');$(':root').css({ 'font-size': '18px' });
        $('body').removeClass('disabledTransitions');
    };

};
