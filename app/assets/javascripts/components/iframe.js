document.addEventListener( 'turbolinks:load', function() {
    iframeInit();
});



function iframeInit() {

    var inIframe = ( window.location != window.parent.location ) ? true : false;

    if ( inIframe === true && $('.nativeGapScalingEnabled').length > 0 ) {
        if ( $(':root').css('font-size') == '17.5px' ) {
            $(':root').css({ 'font-size': '17.5px' });
        } else {
            $('body *').css({ 'transition': 'none' });
            $(':root').css({ 'font-size': '17.5px' });
            $('body *').css({ 'transition': 'inherit' });
        };
    };

};
