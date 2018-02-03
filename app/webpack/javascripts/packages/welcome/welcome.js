import $ from 'jquery';

import * as _index from './index';
import * as _product from './product';

$(document).on( 'turbolinks:load', function() {
    _index.init();
    if ($('body.welcome.product').length != 0) {
        _product.init();
        _product.scroll();
    };
});
