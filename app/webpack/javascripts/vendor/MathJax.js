import 'mathjax';

export function init() {
    MathJax.Hub.Queue(['Typeset', MathJax.Hub]);
};
