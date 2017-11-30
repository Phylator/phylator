$(document).on( 'turbolinks:load', function() {
    $('body.turbolinks-animate').turbolinksAnimate({ 'duration': '0.35s' });
    turbolinksAnimateAppear();
});
$(document).on( 'turbolinks:request-start', function() {
    turbolinksAnimateDisappear();
});
$(window).on( 'popstate', function(event) {
    turbolinksAnimateDisappear();
});
