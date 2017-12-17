$(document).on( 'turbolinks:load', function() {
    $('body').turbolinksAnimate();
    turbolinksAnimateAppear();
});
$(document).on( 'turbolinks:request-start', function() {
    turbolinksAnimateDisappear();
});
$(window).on( 'popstate beforeunload', function(event) {
    turbolinksAnimateDisappear();
});
