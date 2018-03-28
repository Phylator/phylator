document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('body.search.index')) {
        const instantsearch = require('instantsearch.js');
        document.querySelector('input#query').addEventListener( 'change', function() {
            let testString = this.value;
            const search = instantsearch({
                appId: algoliasearchApplicationId,
                apiKey: algoliasearchSearchKey,
                indexName: testString[0].toUpperCase() + testString.substring(1),
                urlSync: true
            });
            search.start();
        })
    }
})
