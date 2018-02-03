import $ from 'jquery';
// import TurbolinksAnimate from 'turbolinks-animate';

import * as _algoliasearch from './algoliasearch';
import * as _jqueryFlexdatalist from './jquery-flexdatalist';
// import * as _izimodal from './izimodal';
// import * as _mathjax from './mathjax';
// import * as _stripe from './stripe';
// import * as _timeago from './timeago';

$(document).on( 'turbolinks:load', function() {
    // TurbolinksAnimate.init();
    _jqueryFlexdatalist.init();
    // _izimodal.init();
    // _mathjax.init();
    // _timeago.init();
    // if ( $('body.packs.show').length != 0 ) {
    //     _stripe.init('<%= Settings.stripe.publishable_key %>');
    // };
    // if ( $('body.search').length > 0 ) {
        _algoliasearch.init( '<%= Settings.algoliasearch.application_id %>', '<%= Settings.algoliasearch.search_key %>' );
    // };
});
