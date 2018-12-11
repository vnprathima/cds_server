var https = require('https');
var fs = require('fs');
var path = require('path');
var url = require('url');
var options = {
      key: fs.readFileSync(path.join(__dirname, '..', 'localhost.key'))
    , cert: fs.readFileSync(path.join(__dirname, '..', 'localhost.cert'))
    };

function app(req, res) {
  var service = require('./service.js');
    const reqUrl = url.parse(req.url, true);
    console.log(req);
    // GET Endpoint..............................
    if (reqUrl.pathname == '/' && req.method === 'GET') {
        console.log('Request Type:' + req.method + ' Endpoint: ' +reqUrl.pathname);
        service.get(req, res);

    // POST Endpoint
    } else if (reqUrl.pathname == '/execute_cql' && req.method === 'POST') {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        if(req.headers.authorization !== null){
            var Client = require('node-rest-client').Client;
            var client = new Client();
            var args = { 
                        "token": req.headers.authorization,
                        "client-id": "app-token",
                        "client-secret": "237b167a-c4d0-4861-856d-6decf5426022" };
            console.log("Inside If");
            client.post("https://54.227.173.76:8443/auth/realms/ClientFhirServer/protocol/openid-connect/token/introspect", args, function (data, response) {
                console.log(data);
                console.log(response);
                service.executeCql(req, res);
            });
        } else {
            service.invalidAuthorization(req,res);
        }
        
    } else {
        console.log('Request Type:' + req.method + ' Invalid Endpoint: ' + reqUrl.pathname);
        service.invalidRequest(req, res);
    }
}

module.exports = https.createServer(options, app);