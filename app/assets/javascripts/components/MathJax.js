document.addEventListener( 'turbolinks:load', function() {
    MathJaxInit();
});



function MathJaxInit() {
    MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
};
