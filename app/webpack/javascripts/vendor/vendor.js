import $ from 'jquery';

import * as _algoliasearch from './algoliasearch';
import * as _aos from './aos';
import * as _deviseOnesignal from './deviseOnesignal';
// import * as _izimodal from './izimodal';
import * as _jqueryFlexdatalist from './jquery-flexdatalist';
import * as _mathjax from './mathjax';
import * as _stripe from './stripe';
import * as _timeago from './timeago';
import * as _turbolinksAnimate from './turbolinks-animate';

$(document).on( 'turbolinks:load', function() {
    _aos.init();
    _deviseOnesignal.init();
    // _izimodal.init();
    _jqueryFlexdatalist.init();
    _mathjax.init();
    _timeago.init();
    _turbolinksAnimate.init();
    if ( $('body.packs.show').length > 0 ) {
        _stripe.init(stripePublicationKey);
    };
    if ( $('body.search').length > 0 ) {
        _algoliasearch.init( algoliasearchApplicationId, algoliasearchSearchKey );
    };
    if ( $('body.calculations').length > 0 ) {
        OneSignalSubscribe();
    };
});
