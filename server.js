const hostname = '0.0.0.0';
const port = 4200;

const server = require('./rest-controller.js');

server.listen(port, hostname, () => {
    console.log('Listening on http://0.0.0.0:' + port);
});
