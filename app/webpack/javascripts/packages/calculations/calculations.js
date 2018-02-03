import $ from 'jquery';

import * as _form from './form';
import * as _new from './new';
import * as _show from './show';

$(document).on( 'turbolinks:load', function() {
    _form.removeMeasurement();
    _new.init();
    _new.marginOfErrorInit();
    _show.init();
});
