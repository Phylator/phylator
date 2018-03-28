import $ from 'jquery';

document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.search.index')) {
        const algoliasearch = require('algoliasearch');
        const tab = document.querySelector('#tab').innerHTML;
        const client = algoliasearch( algoliasearchApplicationId, algoliasearchSearchKey );
        let input = document.querySelector('#__query'),
            value = input.value;
        setInterval(() => {
            if (input.value != value) {
                value = input.value;
                if (document.querySelector('#__query').value) {
                    search( client, this.value, tab );
                    if ( tab == 'quantity' ) {
                        search( client, this.value, 'constant' );
                    }
                } else {
                    render(tab);
                }
            }
        }, 1000)
    }
})

function search( client, query, tab ) {
    let index = client.initIndex( tab[0].toUpperCase() + tab.substring(1) );
    index.search( query, ( err, content ) => {
        if (content.hits.length > 0) {
            console.log(content.hits);
            let results = content.hits.map((object) => {
                return object['objectID'];
            });
            render( tab, results );
        } else {
            render(tab);
        }
    });
}
function render( tab, content = null ) {
    $.get( '/app/search.js', { tab: tab, content: content } );
}
