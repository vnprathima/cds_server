const hostname = '127.0.0.1';
const port = 3000;

const server = require('./rest-controller.js');

server.listen(port, hostname, () => {
    console.log('Listening on http://127.0.0.1:' + port);
});
