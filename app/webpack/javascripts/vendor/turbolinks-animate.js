import $ from 'jquery';
window.jQuery = window.$ = $;
import * as turbolinksAnimate from 'turbolinks-animate';

export function init() {
    turbolinksAnimate.TurbolinksAnimate.init();
};
