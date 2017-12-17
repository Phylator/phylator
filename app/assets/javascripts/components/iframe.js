document.addEventListener( 'turbolinks:load', function() {
    iframeInit();
});



function iframeInit() {

    var inIframe = ( window.location != window.parent.location ) ? true : false;

    if ( inIframe === true && $('body#scaling-custom').length > 0 ) {
        $('*').css({ 'transition': 'none' });
        $(':root').css({ 'font-size': '17px' });
        $('*').css({ 'transition': 'inherit' });
    };

};
