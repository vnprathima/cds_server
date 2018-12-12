const http = require('http');
const url = require('url');

module.exports = http.createServer((req, res) => {
    var service = require('./service.js');
    const reqUrl = url.parse(req.url, true);
    // GET Endpoint..............................
    if (reqUrl.pathname == '/' && req.method === 'GET') {
        console.log('Request Type:' + req.method + ' Endpoint: ' +reqUrl.pathname);
        service.get(req, res);

    // POST Endpoint
    } else if (reqUrl.pathname == '/execute_cql' && req.method === 'POST') {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        if(req.headers.authorization){
            const authURL = "https://54.227.173.76:8443/auth/realms/ClientFhirServer/protocol/openid-connect/token/introspect";
            var Client = require('node-rest-client').Client;
            var client = new Client();
            var token = req.headers.authorization;
            token = token.replace("Bearer ", "");
            var params = {token: token,
                        client_id: "app-token",
                        client_secret: "237b167a-c4d0-4861-856d-6decf5426022"};
            const inputParams = Object.keys(params).map((key) => {
                return encodeURIComponent(key) + '=' + encodeURIComponent(params[key]);
            }).join('&');

            var args = {
                        headers: { "Content-Type": "application/x-www-form-urlencoded" },
                        data:inputParams, 
                        rejectUnauthorized: false 
                        };
            client.post(authURL, args, function (data, response) {
                if('active' in data && data['active'] == true){
                    service.executeCql(req, res);
                } 
                if('active' in data && data['active'] == false){
                    service.invalidAuthorization(req,res);
                }
            });
        } else {
            sesrvice.invalidAuthorization(req,res);
        }
        
    } else {
        console.log('Request Type:' + req.method + ' Invalid Endpoint: ' + reqUrl.pathname);
        service.invalidRequest(req, res);
    }
});