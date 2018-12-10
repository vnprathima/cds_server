
const hostname = '127.0.0.1';
const port = 3000;

// const server = require('./index.js');

const server = require('./rest-controller.js');

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});
