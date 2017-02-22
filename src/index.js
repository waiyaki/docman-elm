require('./index.css');

const Elm = require('./Main.elm');
const mountNode = document.getElementById('root');

const App = Elm.Main.embed(mountNode, {
  token: getToken()
});

App.ports.setToken.subscribe(setToken);
App.ports.removeToken.subscribe(removeToken);

function getToken() {
  let token;
  try {
    token = window.localStorage.getItem('token');
  } catch (e) {
    // Noop
  }
  return token;
}

function setToken(token) {
  try {
    window.localStorage.setItem('token', token);
  } catch (e) {
    // Noop
  }
}


function removeToken() {
  try {
    window.localStorage.removeItem('token');
  } catch (e) {
    // Noop
  }
}
