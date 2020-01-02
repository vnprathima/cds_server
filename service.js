const url = require('url');
const fs = require('fs');
var exec = require('child_process').exec;
var config = require("./properties.json");
const axios = require('axios');

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
            console.log("username----", postBody);
            if (postBody.user_name) {
                let update_query = "UPDATE config SET ";
                let update_cols = "";
                Object.keys(postBody).forEach(function (key) {
                    if (key != "user_name") {
                        update_cols += key + "='" + postBody[key] + "',";
                    }
                });
                update_cols = update_cols.substring(0, update_cols.length - 1)
                update_query += update_cols + " where user_name='" + postBody.user_name + "'"
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
                    res.end(JSON.stringify({ "Success": "Config has been updated Successfully for user" + postBody.user_name }));
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
                        res.end(JSON.stringify({ "success": "New user config has been created with id" + insert_result.insertId }));
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
                                update_cols += key + "='" + now + "',";
                            } else {
                                update_cols += key + "='" + row + "',";
                            }
                        }
                    });

                    update_cols = update_cols.substring(0, update_cols.length - 1);
                    console.log("Update statement---", update_cols);
                    update_query += update_cols + " where user_name='" + postBody.user_name + "'"
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
exports.convertBundle = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            postBody = JSON.parse(body);
            if (postBody.hasOwnProperty("type")) {
                postBody.type = "transaction"
            }
            if (postBody.hasOwnProperty("entry")) {
                postBody.entry.map((item) => {
                    item["request"] = {
                        "method": "POST",
                        "url": item.resource.resourceType
                    }
                });
                res.statusCode = 200;
                res.setHeader('Access-Control-Allow-Origin', '*');
                res.setHeader('Access-Control-Allow-Credentials', 'true');
                res.setHeader('Access-Control-Allow-Methods', 'GET');
                res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify(postBody));
            }

        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Invalid Inputs !!")
    }
}
/**
 * param 1 : fhir_url : string
 * param 2 : resource_type : string(FHIR resource type that needs to be deleted)
 **/
exports.deleteFHIRResource = function (req, res, ) {
    body = '';
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try {
        req.on('end', function () {
            postBody = JSON.parse(body);
            var fhir_url;
            if (postBody.hasOwnProperty("fhir_url")) {
                fhir_url = postBody.fhir_url;
            }
            if (postBody.hasOwnProperty("resource_type")) {
                axios.get(fhir_url + "/" + postBody.resource_type)
                    .then(response => {
                        console.log(response.data.entry);
                        deleted_resources = 0
                        not_deleted_resources = 0
                        var promises = response.data.entry.map(function (param) {
                            return axios.delete(fhir_url + "/" + param.resource.resourceType + "/" + param.resource.id).then(del_res => {
                                // console.log("delete Res---",del_res.data);
                                return deleted_resources += 1;
                            }).catch((err) => {
                                console.log("delete err---",err.data);
                                return not_deleted_resources += 1;
                            })
                        });
                        Promise.all(promises).then(function (responses) {
                            console.log(responses);
                            final_res = {"deteled":responses[0],"not_deleted":responses[1]}
                            res.statusCode = 200;
                            res.setHeader('Content-Type', 'application/json');
                            console.log("response----", JSON.stringify(responses))
                            res.end(JSON.stringify(final_res));
                        }).catch((err) => {
                            res.end('Error in sending response !!', err);
                        })
                    })
                    .catch(error => {
                        console.log(error);
                    });
            }

        });
    } catch (err) {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/plain');
        res.end("Invalid Inputs !!")
    }
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
        console.log(postBody);

        if (!postBody.hasOwnProperty("cql") && postBody.cql.trim().length === 0 && !postBody.hasOwnProperty("patientBundle")) {
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
        var cql_json_file = postBody.cql + '.json';
        try {
            const elmFile = JSON.parse(fs.readFileSync(path.join(__dirname, 'cqls', cql_json_file), 'utf8'));
            const libraries = {
                FHIRHelpers: JSON.parse(fs.readFileSync(path.join(__dirname, 'fhir-helpers', 'v1.0.2', 'FHIRHelpers.json'), 'utf8'))
            };
            const library = new cql.Library(elmFile, new cql.Repository(libraries));

            // Create the patient source
            const patientSource = cqlfhir.PatientSource.FHIRv400();

            // Load the patient source with patients
            const bundles = [];
            bundles.push(postBody.patientBundle);
            patientSource.loadBundles(bundles);

            // Extract the value sets from the ELM
            let valueSets = [];
            if (elmFile.library && elmFile.library.valueSets && elmFile.library.valueSets.def) {
                valueSets = elmFile.library.valueSets.def;
            }

            // Set up the code service, loading from the cache if it exists
            const codeService = new cqlvsac.CodeService(path.join(__dirname, 'vsac_cache'), true);
            console.log("BEfore Ensure valuesets---", patientSource);
            // Ensure value sets, downloading any missing value sets
            codeService.ensureValueSets(valueSets, vsacUser, vsacPass)
                .then(() => {
                    console.log("Vsac Password--", vsacPass);
                    // Value sets are loaded, so execute!
                    const executor = new cql.Executor(library, codeService);
                    const results = executor.exec(patientSource);
                    console.log("exectutor done--- resultspatientResults", results);
                    for (const id in results.patientResults) {
                        console.log(id, 'what is id')
                        const result = results.patientResults[id];
                        console.log(`${id}:`, postBody.cql, result);
                        res.statusCode = 200;
                        res.setHeader('Content-Type', 'application/json');
                        console.log(`\t Result: ${result}`);
                        res.end(JSON.stringify(result) + '\n');
                    }
                })
                .catch((err) => {
                    console.log(err);
                    res.end('Error Downloading ValueSets !!', err);
                });
        } catch (err) {
            console.log(err);
            res.statusCode = 400;
            res.setHeader('Content-Type', 'text/plain');
            res.end("Unable to execute cql !!")
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
