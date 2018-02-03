import $ from 'jquery';
window.jQuery = window.$ = $;
require('izimodal');

export function init() {
    console.log('flexdatalist');
    $('.modal').iziModal({
        width: '85%'
    });
    $('.md-trigger').click(function(event) {
        event.preventDefault();
        $('.modal' + $(this).data('modal')).iziModal('open');
    });
    console.log('flexdatalist');
};

function componentsModalOpen(el) {
    $(el).iziModal('open');
};

function componentsModalClose(el) {
    $(el).iziModal('close');
};
