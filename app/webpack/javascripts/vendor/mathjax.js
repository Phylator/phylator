import 'mathjax/MathJax';

export function init() {
    MathJax.Hub.Queue(['Typeset', MathJax.Hub]);
};
