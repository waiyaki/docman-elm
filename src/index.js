require('./index.css');
console.log('Yay');

const Elm = require('./Main.elm');
const mountNode = document.getElementById('root');

Elm.Main.embed(mountNode);
