const url = require('url');
const fs = require('fs');
var exec = require('child_process').exec;
var config = require("./properties.json");

exports.get = function (req, res) {
    const reqUrl = url.parse(req.url, true);
    var response = {
        "result": "App is up and running !!"
    };

    res.statusCode = 200;
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(response));
};

exports.executeCql = function (req, res, ) {
    body = '' ;
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
        [vsacUser, vsacPass] = [config.vsac_user,config.vsac_password];

        // postBody = JSON.parse(body);
        if(!postBody.hasOwnProperty("cql") && postBody.cql.trim().length === 0  && !postBody.hasOwnProperty("request_for") && postBody.request_for.trim().length === 0 && !postBody.hasOwnProperty("patientFhir") && !config.cqls_list.includes(postBody.cql)){
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
        var cql_json_file = postBody.cql +'_requirements.json';
        if (postBody.request_for){
            cql_json_file = postBody.cql + '_' + postBody.request_for +'.json';
        } 
        console.log('Json file Given :', cql_json_file);
        try {
            const elmFile = JSON.parse(fs.readFileSync(path.join(__dirname, 'cqls', cql_json_file), 'utf8'));
            const libraries = {
            FHIRHelpers: JSON.parse(fs.readFileSync(path.join(__dirname, 'fhir-helpers', 'v1.0.2', 'FHIRHelpers.json'), 'utf8'))
            };
            const library = new cql.Library(elmFile, new cql.Repository(libraries));

            // Create the patient source
            const patientSource = cqlfhir.PatientSource.FHIRv102();

            // Load the patient source with patients
            const bundles = [];
            bundles.push(postBody.patientFhir);
            patientSource.loadBundles(bundles);
            
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
                console.log("PAtient fhir---",vsacPass);
                // Value sets are loaded, so execute!
                const executor = new cql.Executor(library, codeService);
                console.log("exectutor initiated---");
                const results = executor.exec(patientSource);
                console.log("exectutor done---");
                for (const id in results.patientResults) {
                    const result = results.patientResults[id];
                    console.log(`${id}:`);
                    res.statusCode = 200;
                    res.setHeader('Content-Type', 'application/json');
                    if (postBody.request_for == 'requirements'){
                        console.log("\tRequirements:", result.Requirements);
                        if(result.hasOwnProperty("PriorAuthorization")){
                            res.end(JSON.stringify({"requirements":result.Requirements,"prior_authorization":result.PriorAuthorization}) + '\n');
                        } else {
                            res.end(JSON.stringify({"requirements":result.Requirements}) + '\n');
                        }
                    } else if (postBody.request_for == 'decision'){
                        console.log(`\tCoverage: ${result.Coverage}`);
                        res.end(JSON.stringify({"Coverage":result.Coverage}) + '\n');
                    }
                }
            })
            .catch( (err) => {
                // There was an error downloading the value sets!
                res.end('Error Processing cql !!',err);
            });
        } catch (err){
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