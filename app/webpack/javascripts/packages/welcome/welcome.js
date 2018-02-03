import $ from 'jquery';

import * as _index from './index';
import * as _product from './product';

$(document).on( 'turbolinks:load', function() {
    if ( $('body.welcome.index').length > 0 ) {
        _index.init();
    };
    if ( $('body.welcome.product').length > 0 ) {
        _product.init();
    };
});
