import $ from 'jquery';

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.search.index')) {
        const algoliasearch = require('algoliasearch');
        const tab = document.querySelector('#tab').innerHTML;
        const client = algoliasearch( algoliasearchApplicationId, algoliasearchSearchKey );
        document.querySelector('input#__query').addEventListener( 'input', function() {
            if (this.value) {
                search( client, this.value, tab );
                if ( tab == 'quantity' ) {
                    search( client, this.value, 'constant' );
                }
            } else {
                render(tab);
            }
        })
    }
})

function search( client, query, tab ) {
    let index = client.initIndex( tab[0].toUpperCase() + tab.substring(1) );
    index.search( query, ( err, content ) => {
        if (content.hits.length > 0) {
            render(tab);
        } else {
            render( tab, content.hits );
        }
    });
}
function render( tab, content = null ) {
    $.get( '/app/search.js', { tab: tab, content: content } );
}
