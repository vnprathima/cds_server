const url = require('url');
const fs = require('fs');
var exec = require('child_process').exec;
var config = require("./properties.json");

var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'prathima',
    password: 'prathima',
    database: 'payer'
});

exports.get = function (req, res) {
    const reqUrl = url.parse(req.url, true);
    var response = {
        "result": "App is up and running !!"
    };

    res.statusCode = 200;
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(response));
};

function Singleton(pat) {
    // lazy 
    if (Singleton.prototype.myInstance == undefined) {
        Singleton.prototype.myInstance = pat;
    }
    return Singleton.prototype.myInstance;
}
exports.getPayers = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            connection.query('SELECT * FROM payers', function (error, results, fields) {
                if (error) throw error;
                console.log('The payer result is: ', results);
                res.statusCode = 200;
                res.setHeader('Access-Control-Allow-Origin', '*');
                res.setHeader('Access-Control-Allow-Credentials', 'true');
                res.setHeader('Access-Control-Allow-Methods', 'GET');
                res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
                res.setHeader('Content-Type', 'application/json');
                console.log("response----", JSON.stringify(results))
                res.end(JSON.stringify(results));
            });
        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Unable to retrieve data !!")
    }

}
exports.getCodes = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            connection.query('SELECT * FROM codes', function (error, results, fields) {
                if (error) throw error;
                console.log('The payer result is: ', results);
                res.statusCode = 200;
                res.setHeader('Access-Control-Allow-Origin', '*');
                res.setHeader('Access-Control-Allow-Credentials', 'true');
                res.setHeader('Access-Control-Allow-Methods', 'GET');
                res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
                res.setHeader('Content-Type', 'application/json');
                console.log("response----", JSON.stringify(results))
                res.end(JSON.stringify(results));
            });
        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Unable to retrieve data !!")
    }
}
exports.getConfig = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            postBody = JSON.parse(body);
            if (postBody.user_name) {
                connection.query('SELECT * FROM config where user_name = "' + postBody.user_name + '"', function (error, results, fields) {
                    if (error) throw error;
                    console.log('The config result is: ', results[0]);
                    res.statusCode = 200;
                    res.setHeader('Access-Control-Allow-Origin', '*');
                    res.setHeader('Access-Control-Allow-Credentials', 'true');
                    res.setHeader('Access-Control-Allow-Methods', 'POST,OPTIONS');
                    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
                    res.setHeader('Content-Type', 'application/json');
                    console.log("response----", JSON.stringify(results[0]))
                    res.end(JSON.stringify(results[0]));
                });
            } else {
                res.statusCode = 422;
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify({ "error": "Unable to process as the input is not valid !!" }));
            }

        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Unable to retrieve data !!")
    }
}
exports.updateConfig = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            postBody = JSON.parse(body);
            console.log("username----",postBody);
            if (postBody.user_name) {
                let update_query = "UPDATE config SET ";
                let update_cols = "";
                Object.keys(postBody).forEach(function (key) {
                    if(key != "user_name"){
                        update_cols += key+"='"+postBody[key]+"',";
                    }
                });
                update_cols = update_cols.substring(0, update_cols.length - 1)
                update_query += update_cols +" where user_name='"+postBody.user_name+"'"
                connection.query(update_query, function (error, update_result, fields) {
                    if (error) {
                        console.log(error);
                        res.statusCode = 422;
                        res.setHeader('Content-Type', 'application/json');
                        res.end(JSON.stringify({ "error": "Unable to process as the input is not valid !!" }));
                    }
                    console.log('The config result is: ', update_result);
                    res.statusCode = 200;
                    res.setHeader('Access-Control-Allow-Origin', '*');
                    res.setHeader('Access-Control-Allow-Credentials', 'true');
                    res.setHeader('Access-Control-Allow-Methods', 'GET');
                    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify({"Success":"Config has been updated Successfully for user"+postBody.user_name}));
                });
            } else {
                res.statusCode = 422;
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify({ "error": "Unable to process as the input is not valid !!" }));
            }
        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Unable to retrieve data !!")
    }
}
exports.createConfig = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            postBody = JSON.parse(body);
            if (postBody.user_name) {
                connection.query('SELECT * FROM config where user_name = "mettles_default_user_config"', function (error, result, fields) {
                    if (error) throw error;
                    console.log('The config result is: ', result[0]);
                    let insert_query = "INSERT INTO config "
                    let columns = "";
                    let values = "";
                    let date_ob = new Date();
                    // current date
                    // adjust 0 before single digit date
                    let date = ("0" + date_ob.getDate()).slice(-2);

                    // current month
                    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);

                    // current year
                    let year = date_ob.getFullYear();

                    // current hours
                    let hours = date_ob.getHours();

                    // current minutes
                    let minutes = date_ob.getMinutes();

                    // current seconds
                    let seconds = date_ob.getSeconds();
                    
                    let now = year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds
                    console.log("now---", now);

                    Object.keys(result[0]).forEach(function (key) {
                        if (key != "id") {
                            columns += key + ",";
                            var row = result[0][key];
                            if (key === "user_name") {
                                values += "'" + postBody.user_name + "',"
                            } else if (key === "last_updated") {
                                values += "'" + now + "',"
                            } else {
                                values += "'" + row + "',";
                            }
                        }
                    });

                    columns = columns.substring(0, columns.length - 1);
                    values = values.substring(0, values.length - 1);
                    console.log("Columns,rows---", columns, values);
                    insert_query += "(" + columns + ") VALUES (" + values + ")";
                    console.log("Insert Query---" + insert_query);
                    connection.query(insert_query, function (err, insert_result, fields) {
                        if (error) throw error;
                        console.log('The config result is: ', insert_result);
                        res.statusCode = 200;
                        res.setHeader('Access-Control-Allow-Origin', '*');
                        res.setHeader('Access-Control-Allow-Credentials', 'true');
                        res.setHeader('Access-Control-Allow-Methods', 'GET');
                        res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
                        res.setHeader('Content-Type', 'application/json');
                        res.end(JSON.stringify({"success":"New user config has been created with id"+insert_result.insertId}));
                    });
                });
            } else {
                res.statusCode = 422;
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify({ "error": "Unable to process as the input is not valid !!" }));
            }

        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Unable to retrieve data !!")
    }
}
exports.resetConfig = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            postBody = JSON.parse(body);
            if (postBody.user_name) {
                connection.query('SELECT * FROM config where user_name = "mettles_default_user_config"', function (error, result, fields) {
                    if (error) throw error;
                    console.log('The config result is: ', result[0]);
                    let update_query = "UPDATE config SET "
                    let update_cols = "";
                    let date_ob = new Date();
                    // current date
                    // adjust 0 before single digit date
                    let date = ("0" + date_ob.getDate()).slice(-2);

                    // current month
                    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);

                    // current year
                    let year = date_ob.getFullYear();

                    // current hours
                    let hours = date_ob.getHours();

                    // current minutes
                    let minutes = date_ob.getMinutes();

                    // current seconds
                    let seconds = date_ob.getSeconds();
                    
                    let now = year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds
                    console.log("now---", now);

                    Object.keys(result[0]).forEach(function (key) {
                        if (key != "id" && key !== "user_name") {
                            var row = result[0][key];
                            if (key === "last_updated") {
                                update_cols += key+"='"+now+"',";
                            } else {
                                update_cols += key+"='"+row+"',";
                            }
                        }
                    });

                    update_cols = update_cols.substring(0, update_cols.length - 1);
                    console.log("Update statement---", update_cols);
                    update_query += update_cols +" where user_name='"+postBody.user_name+"'"
                    console.log("Update Query---" + update_query);
                    connection.query(update_query, function (err, insert_result, fields) {
                        if (error) throw error;
                        console.log('The config result is: ', insert_result);
                        res.statusCode = 200;
                        res.setHeader('Access-Control-Allow-Origin', '*');
                        res.setHeader('Access-Control-Allow-Credentials', 'true');
                        res.setHeader('Access-Control-Allow-Methods', 'GET');
                        res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
                        res.setHeader('Content-Type', 'application/json');
                        result[0]["user_name"] = postBody.user_name;
                        res.end(JSON.stringify(result[0]));
                    });
                });
            } else {
                res.statusCode = 422;
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify({ "error": "Unable to process as the input is not valid !!" }));
            }

        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Unable to retrieve data !!")
    }
}
async function runPriorAuthRule(patient, payer, template, code) {
    var rulefile = "./prior_auth_rules/" + payer + "/" + template + ".js";
    console.log("rule file---", rulefile)
    var includedRule = require(rulefile);
    return await includedRule.priorAuthRule(patient, code);
}
async function getTemplate(hcpc_code, payer) {
    return new Promise(function (resolve, reject) {
        connection.query('SELECT template FROM codes where code LIKE "' + hcpc_code + '"',
            function (error, results, fields) {
                if (error) {
                    reject(new Error('Ooops, something broke!'));
                } else {
                    console.log('The template is: ', results[0].template);
                    var template = results[0].template;
                    if (template != null || template != undefined) {
                        runPriorAuthRule({}, payer, template, hcpc_code).then((prior_auth) => {
                            resolve({ "value": prior_auth, "template": payer + ":" + template });
                        }).catch((error) => {
                            reject(new Error('Unable to run Rule for template-' + template));
                        })
                    }
                }
            })
    });
}
exports.getCqlData = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            postBody = JSON.parse(body);
            if (postBody["serviceRequest"].hasOwnProperty("category")) {
                var promises = postBody["serviceRequest"].category.map(function (param) {
                    if (param.hasOwnProperty("code") && param.code.hasOwnProperty("coding") && param.code.coding.length > 0 && param.code.coding[0].hasOwnProperty("code")) {
                        var hcpc_code = param.code.coding[0].code
                        var payer = "";
                        if (postBody.hasOwnProperty("payerName")) {
                            payer = postBody["payerName"]
                        } else {
                            res.end('Missing Input : payerName');
                        }
                        /**Get Template for a code from codes DB */
                        return getTemplate(hcpc_code, payer).then((data) => {
                            data['code'] = hcpc_code;
                            return data;
                        }).catch((err) => {
                            console.log(err);
                            res.end('Error retieving template for code ' + hcpc_code + ' !!', err);
                        });
                    }
                })
                Promise.all(promises).then(function (responses) {
                    console.log(responses);
                    res_obj = {};
                    responses.map((item) => {
                        res_obj[item.code] = { "value": item.value };
                    })
                    var final_res = { "prior_auth": res_obj, "template": responses[0].template }
                    res.statusCode = 200;
                    res.setHeader('Content-Type', 'application/json');
                    console.log("response----", JSON.stringify(final_res))
                    res.end(JSON.stringify(final_res));
                }).catch((err) => {
                    res.end('Error in sending response !!', err);
                })
            }
        })
    }
    catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Invalid Inputs !!")
    }

}

exports.executeCql = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    req.on('end', function () {
        postBody = JSON.parse(body);
        const fs = require('fs');
        const path = require('path');
        const cql = require('cql-execution');
        const cqlfhir = require('cql-exec-fhir');
        const cqlvsac = require('cql-exec-vsac');

        let vsacUser, vsacPass;
        [vsacUser, vsacPass] = [config.vsac_user, config.vsac_password];

        // postBody = JSON.parse(body);
        let postBodyCql
        let cqlCode
        let postBodyPatient
        if (postBody.hasOwnProperty('entry')) {
            for (var i = 0; i < postBody.entry.length; i++) {
                if (postBody.entry[i].resource.resourceType == 'ServiceRequest') {
                    cqlCode = postBody.entry[i].resource.codeCodeableConcept.coding[0].code
                }
                if (postBody.entry[i].resource.resourceType == 'Patient') {
                    postBodyPatient = postBody.entry[i].resource
                }
            }
        }

        console.log(cqlCode, '=======')
        let cql_mapping_json = config.cql_mapping_json
        console.log(cql_mapping_json, '=======')
        Object.keys(cql_mapping_json).map(function (key, index) {
            if (cql_mapping_json[key].includes(cqlCode)) {
                postBodyCql = key
            }
        });
        if (!postBody.hasOwnProperty("cql") && postBodyCql.trim().length === 0 && !postBody.hasOwnProperty("request_for") && postBody.request_for.trim().length === 0 && !postBody.hasOwnProperty("patientFhir") && !config.cqls_list.includes(postBodyCql)) {
            res.statusCode = 400;
            res.setHeader('Content-Type', 'text/plain');
            res.end("Invalid Inputs !!")
        }
        console.log('/-------------------------------------------------------------------------------');
        console.log('| Executing:', postBody.cql);
        if (vsacUser) {
            console.log('| VSAC User:', vsacUser, vsacPass);
        }
        console.log('\\-------------------------------------------------------------------------------');

        // Set up the library
        var cql_json_file = postBodyCql + '_decision.json';
        if (postBody.request_for) {
            cql_json_file = postBodyCql + '_' + postBody.request_for + '.json';
        }
        console.log('Json file Given :', cql_json_file, postBody.hasOwnProperty('request_for'));
        try {
            const elmFile = JSON.parse(fs.readFileSync(path.join(__dirname, 'cqls', cql_json_file), 'utf8'));
            const libraries = {
                FHIRHelpers: JSON.parse(fs.readFileSync(path.join(__dirname, 'fhir-helpers', 'v1.0.2', 'FHIRHelpers.json'), 'utf8'))
            };
            const library = new cql.Library(elmFile, new cql.Repository(libraries));

            // Create the patient source
            const patientSource = cqlfhir.PatientSource.FHIRv400();
            // const patientSource = new cql.PatientSource();

            // Load the patient source with patients
            let patient = {
                "resourceType": "Bundle",
                "type": "collection",
                "id": "example1",
                "meta": {
                    "versionId": "1",
                    "lastUpdated": "2014-08-18T01:43:30Z"
                },
                "base": "http://example.com/base",
                "entry":
                    [{
                        'resource': postBodyPatient
                    }]
            };

            patientSource.loadBundles([patient]);

            // console.log(patientSource._bundles,'12333')
            // Extract the value sets from the ELM
            let valueSets = [];
            if (elmFile.library && elmFile.library.valueSets && elmFile.library.valueSets.def) {
                valueSets = elmFile.library.valueSets.def;
            }

            // Set up the code service, loading from the cache if it exists
            const codeService = new cqlvsac.CodeService(path.join(__dirname, 'vsac_cache'), true);

            // Ensure value sets, downloading any missing value sets
            codeService.ensureValueSets(valueSets, vsacUser, vsacPass)
                .then(() => {
                    console.log("PAtient fhir---", vsacPass);
                    // Value sets are loaded, so execute!
                    const executor = new cql.Executor(library, codeService);
                    // console.log("exectutor initiated---",executor.exec(patientSource));
                    const results = executor.exec(patientSource);
                    console.log("exectutor done--- resultspatientResults", results);
                    for (const id in results.patientResults) {
                        console.log(id, 'what is id')
                        const result = results.patientResults[id];
                        console.log(`${id}:`, postBody.request_for, result);
                        res.statusCode = 200;
                        res.setHeader('Content-Type', 'application/json');
                        // if (postBody.request_for == 'requirements'){
                        //     console.log("\tRequirements:", result.Requirements);
                        //     if(result.hasOwnProperty("PriorAuthorization")){
                        //         res.end(JSON.stringify({"requirements":result.Requirements,
                        //         "prior_authorization":result.PriorAuthorization,
                        //         "pa_requirements":result.PriorAuthorizationRequirements}) + '\n');
                        //     } else {
                        //         res.end(JSON.stringify({"requirements":result.Requirements}) + '\n');
                        //     }
                        // } else if (postBody.request_for == 'decision'){
                        //     console.log(`\tCoverage: ${result.Coverage}`);
                        //     res.end(JSON.stringify({"Coverage":result.Coverage}) + '\n');
                        // }
                        console.log(`\tCoverage: ${result['Coverage Criteria']}`);
                        res.end(JSON.stringify({ "Coverage": result['Coverage Criteria'] }) + '\n');
                    }
                })
                .catch((err) => {
                    console.log(err);
                    // There was an error downloading the value sets!
                    res.end('Error Processing cql !!', err);
                });
        } catch (err) {
            res.statusCode = 400;
            res.setHeader('Content-Type', 'text/plain');
            res.end("Invalid Inputs !!")
        }
    });

};

exports.invalidRequest = function (req, res) {
    res.statusCode = 404;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Invalid URL !!');
};

exports.invalidAuthorization = function (req, res) {
    res.statusCode = 401;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Invalid Authorization!!');
};
