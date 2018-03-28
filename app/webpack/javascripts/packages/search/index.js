import $ from 'jquery';

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.search.index')) {
        const algoliasearch = require('algoliasearch');
        const tab = document.querySelector('#tab').innerHTML;
        const client = algoliasearch( algoliasearchApplicationId, algoliasearchSearchKey );
        document.querySelector('input#__query').addEventListener( 'input', function() {
            document.querySelector('.myg-grid').innerHTML = '';
            if (this.value) {
                search( this.value, tab );
                if ( tab == 'quantity' ) {
                    search( this.value, 'constant' );
                }
            } else {
                render(tab);
            }
        })
    }
})

function search( query, tab ) {
    let index = client.initIndex( tab[0].toUpperCase() + tab.substring(1) );
    index.search( query, ( err, content ) => {
        if (content.hits.length > 0) {
            console.log(content.hits);
            render(tab);
        } else {
            render( tab, content.hits );
        }
    });
}
function render( tab, content = null ) {
    $.get( '/app/search', { tab: tab, content: content }, (data) => {
        $('.myg-grid').append(data);
    });
}
