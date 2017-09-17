document.addEventListener( 'turbolinks:render', function() {
    iframeInit();
});



function iframeInit() {

    var inIframe = ( window.location != window.parent.location ) ? true : false;

    if ( inIframe === true ) {
        $('body').hide();
        $(':root').css({ 'font-size': '18px' });
        setTimeout(function() {
            $('body').fadeIn(500);
        }, 500);
    };

};
