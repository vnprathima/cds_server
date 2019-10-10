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

function Singleton(pat) {
    // lazy 
    if (Singleton.prototype.myInstance == undefined) {
        Singleton.prototype.myInstance = pat;
    }
    return Singleton.prototype.myInstance;
}

exports.getCqlData = function (req, res, ) {
    body = '' ;
    req.on('data', function (chunk) {
        body += chunk.toString();
    });
    try{
        req.on('end', function () {
            postBody = JSON.parse(body);
            var prior_auth_obj = {}
            var template = "";

            if(postBody["deviceRequest"].hasOwnProperty("parameter")){
                for(var paramIndex=0; paramIndex < postBody["deviceRequest"].parameter.length;paramIndex++){
                    var prior_auth = true
                    var param = postBody["deviceRequest"].parameter[paramIndex]
                    
            		if(param.hasOwnProperty("code")){
                            if(param.code.hasOwnProperty("coding")){
                                if(param.code.coding.length > 0){
                                    if(param.code.coding[0].hasOwnProperty("code")){

                                        var hcpc_code  = param.code.coding[0].code
                                        if(hcpc_code == "A0425"){
                                            prior_auth = false
                                        }
                                        if(config.hcpc_template_mapper.hasOwnProperty(hcpc_code)){
                                            template = config.hcpc_template_mapper[hcpc_code]
                                        }
                                        prior_auth_obj[hcpc_code] = {"value":prior_auth,"title":param.code.coding[0].display}
                                        
                                    }
                                }
                            }
            		}
                }
            }
            res.statusCode = 200;
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify({"prior_auth":prior_auth_obj,"template":template}))
       

           

        })
    }
    catch(err){
            res.statusCode = 400;
            res.setHeader('Content-Type', 'text/plain');
            res.end("Invalid Inputs !!")
        }

}

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
        let postBodyCql
        let cqlCode
        let postBodyPatient
        if(postBody.hasOwnProperty('entry')){
            for(var i=0;i<postBody.entry.length;i++){
               if( postBody.entry[i].resource.resourceType=='DeviceRequest'){
                cqlCode = postBody.entry[i].resource.codeCodeableConcept.coding[0].code
               }
               if( postBody.entry[i].resource.resourceType=='Patient'){
                postBodyPatient = postBody.entry[i].resource
               }
            }
        }
       
        console.log(cqlCode,'=======')
        let cql_mapping_json = config.cql_mapping_json
	console.log(cql_mapping_json,'=======')
        Object.keys(cql_mapping_json).map(function(key, index) {
            if(cql_mapping_json[key].includes(cqlCode)){
                postBodyCql = key
            }
          });
        if(!postBody.hasOwnProperty("cql") && postBodyCql.trim().length === 0  && !postBody.hasOwnProperty("request_for") && postBody.request_for.trim().length === 0 && !postBody.hasOwnProperty("patientFhir") && !config.cqls_list.includes(postBodyCql)){
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
        var cql_json_file = postBodyCql +'_decision.json';
        if (postBody.request_for){
            cql_json_file = postBodyCql + '_' + postBody.request_for +'.json';
        } 
        console.log('Json file Given :', cql_json_file,postBody.hasOwnProperty('request_for'));
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
            let patient = {"resourceType": "Bundle",
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
                console.log("PAtient fhir---",vsacPass);
                // Value sets are loaded, so execute!
                const executor = new cql.Executor(library, codeService);
                // console.log("exectutor initiated---",executor.exec(patientSource));
                const results = executor.exec(patientSource);
                console.log("exectutor done--- resultspatientResults",results);
                for (const id in results.patientResults) {
                    console.log(id,'what is id')
                    const result = results.patientResults[id];
                    console.log(`${id}:` ,postBody.request_for,result);
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
                    res.end(JSON.stringify({"Coverage":result['Coverage Criteria']}) + '\n');
                }
            })
            .catch( (err) => {
                console.log(err);
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
