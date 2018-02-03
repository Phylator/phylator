import $ from 'jquery';

import * as _alert from './alert';
import * as _copy from './copy';

$(document).on( 'turbolinks:load', function() {
    _alert.init();
    _copy.init();
});
