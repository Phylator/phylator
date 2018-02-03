import $ from 'jquery';
import Clipboard from 'clipboard';

export function init() {

    let clipboard = new Clipboard('.copy');

    clipboard.on( 'success', function(e) {
        // iziToast.success({
        //     title: $('p#copyText').text(),
        //     backgroundColor: '#73d287'
        // });

        e.clearSelection();
    });

    clipboard.on( 'error', function(e) {
        console.error( 'Action:', e.action );
        console.error( 'Trigger:', e.trigger );
    });

};
