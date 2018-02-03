import $ from 'jquery';

export function init() {
    let el = $('p#alert');

    if ( el.text().length > 0 ) {
        // iziToast.error({
        //     title: el.text(),
        //     backgroundColor: '#ec626e'
        // });
    };
};
