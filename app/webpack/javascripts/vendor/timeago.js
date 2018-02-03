import $ from 'jquery';

export function init() {
    if ( $('p#lang').text() == 'de' ) {
        $.timeago.settings.strings = {
            prefixAgo: "vor",
            prefixFromNow: "in",
            suffixAgo: "",
            suffixFromNow: "",
            seconds: "wenigen Sekunden",
            minute: "etwa einer Minute",
            minutes: "%d Minuten",
            hour: "etwa einer Stunde",
            hours: "%d Stunden",
            day: "etwa einem Tag",
            days: "%d Tagen",
            month: "etwa einem Monat",
            months: "%d Monaten",
            year: "etwa einem Jahr",
            years: "%d Jahren"
        };
    };
    // more translations: https://github.com/rmm5t/jquery-timeago/tree/master/locales

    $('.timeago').timeago();
};
