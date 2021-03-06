const http = require('http');
const url = require('url');

module.exports = http.createServer((req, res) => {
    var service = require('./service.js');
    const reqUrl = url.parse(req.url, true);
    // GET Endpoint..............................
    if (reqUrl.pathname == '/' && req.method === 'GET') {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.get(req, res);

        // POST Endpoint
    } else if (reqUrl.pathname == '/execute_cql' && req.method === 'POST') {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        if (req.headers.authorization) {
            const authURL = "https://auth.mettles.com:8443/auth/realms/ProviderCredentials/protocol/openid-connect/token/introspect";
            var Client = require('node-rest-client').Client;
            var client = new Client();
            var token = req.headers.authorization;
            token = token.replace("Bearer ", "");
            var params = {
                token: token,
                client_id: "app-token",
                client_secret: "48bf2c3e-2bd6-4f8d-a5ce-2f94adcb7492"
            };
            const inputParams = Object.keys(params).map((key) => {
                return encodeURIComponent(key) + '=' + encodeURIComponent(params[key]);
            }).join('&');

            var args = {
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                data: inputParams,
                rejectUnauthorized: false
            };
            client.post(authURL, args, function (data, response) {
                console.log("ResponSe", response);
                console.log("data", data);
                if ('active' in data && data['active'] == true) {
                    service.executeCql(req, res);
                }
                if ('active' in data && data['active'] == false) {
                    service.invalidAuthorization(req, res);
                }
            });
        }
        if (!req.headers.authorization) {
            service.executeCql(req, res);
        }
    }
    else if (reqUrl.pathname == '/getCqlData' && req.method === 'POST') {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.getCqlData(req, res);
    }
    else if (reqUrl.pathname == '/getPayers' && (req.method === 'GET' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.getPayers(req, res);
    } 
    else if (reqUrl.pathname == '/getCodes' && (req.method === 'GET' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.getCodes(req, res);
    } 
    else if (reqUrl.pathname == '/getConfig' && (req.method === 'POST' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.getConfig(req, res);
    } 
    else if (reqUrl.pathname == '/updateConfig' && (req.method === 'POST' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.updateConfig(req, res);
    } 
    else if (reqUrl.pathname == '/createConfig' && (req.method === 'POST' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.createConfig(req, res);
    } else if (reqUrl.pathname == '/resetConfig' && (req.method === 'POST' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.resetConfig(req, res);
    } else if (reqUrl.pathname == '/convertBundle' && (req.method === 'POST' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.convertBundle(req, res);
    } else if (reqUrl.pathname == '/deleteFHIRResource' && (req.method === 'POST' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.deleteFHIRResource(req, res);
    } 
/*     else if (reqUrl.pathname == '/transferDocs' && (req.method === 'POST' || req.method === 'OPTIONS')) {
        console.log('Request Type:' + req.method + ' Endpoint: ' + reqUrl.pathname);
        service.transferDocs(req, res);
    } */
    else {
        console.log('Request Type:' + req.method + ' Invalid Endpoint: ' + reqUrl.pathname);
        service.invalidRequest(req, res);
    }
});

