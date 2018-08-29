document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('#suggestion')) {
    let wrapper = document.querySelector('#suggestion');
    wrapper.querySelector('.myg-button__container p > a').addEventListener('click', () => {
      wrapper.style.marginTop = -wrapper.offsetHeight + 'px';
    });
  }
});
