document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.search.index')) {
        let algoliasearch = require('algoliasearch');
        const tab = document.querySelector('#tab').innerHTML;
        const client = algoliasearch( algoliasearchApplicationId, algoliasearchSearchKey );
        const index = client.initIndex( tab[0].toUpperCase() + tab.substring(1) );
        document.querySelector('input#__query').addEventListener( 'input', function() {
            index.search( this.value, ( err, content ) => {
                console.log(content.hits);
            });
        })
    }
})
