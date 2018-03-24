document.addEventListener( 'turbolinks:load', () => {
    if (document.querySelector('#signup')) {
        let wrapper = document.querySelector('#signup');
        wrapper.querySelector('.myg-button--container p > a').addEventListener( 'click', () => wrapper.style.marginTop = -wrapper.offsetHeight + 'px' );
    }
})
