import $ from 'jquery';
import * as algoliasearch from 'algoliasearch';

export function init( app_id, search_key ) {
    console.log('flexdatalist');
    var client = algoliasearch.algoliasearch( app_id, search_key ),
        rawIndex = $('p#tab').text();

    if ( rawIndex == 'calculations' ) {
        rawIndex = 'Calculation';
    } else if ( rawIndex == 'quantities' ) {
        rawIndex = 'Quantity';
    } else if ( rawIndex == 'constants' ) {
        rawIndex = 'Constant';
    } else if ( rawIndex == 'packs' ) {
        rawIndex = 'Pack';
    };
    var index = client.initIndex(rawIndex);

    $('input#query').change(function() {
        start(index, rawIndex, $(this).val());
    });
    console.log('flexdatalist');
};

function start(index, rawIndex, query) {
    $('.content-wrapper .cards').fadeOut(function() {
        $('.content-wrapper .cards').empty();
        index.search( query, { hitsPerPage: 10, page: 0 } ).then(function searchDone(content) {
            if ( content['hits'].length == 0 ) {
                $.get( '/app/search/render', { index: 'Placeholder' }, function(data) {
                    $('.content-wrapper .cards').html(data).fadeIn();
                });
            } else {
                $.each( content['hits'], function( index, value ) {
                    $.get( '/app/search/render', { index: rawIndex, id: value['objectID'] }, function(data) {
                        $('.content-wrapper .cards').append(data).fadeIn();
                    });
                });
            };
        }).catch(function searchFailure(err) {
            console.error(err);
        });
    });
};
