const url = require('url');
const fs = require('fs');
var exec = require('child_process').exec;

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
        // console.log("Input Body---",chunk.toString());
    });
    req.on('end', function () {
        postBody = JSON.parse(body);
        const fs = require('fs');
        const path = require('path');
        const cql = require('cql-execution');
        const cqlfhir = require('cql-exec-fhir');
        const cqlvsac = require('cql-exec-vsac');

        let vsacUser, vsacPass;
        [vsacUser, vsacPass] = ["prathyanusha","Anusha56"];

        console.log('/-------------------------------------------------------------------------------');
        console.log('| Executing:', postBody.cql);
        if (vsacUser) {
        console.log('| VSAC User:', vsacUser);
        }
        console.log('\\-------------------------------------------------------------------------------');

        // Set up the library
        var cql_json_file = postBody.cql +'_requirements.json';
        if (postBody.request_type){
            cql_json_file = postBody.cql + '_' + postBody.request_type +'.json';
        } 
        const elmFile = JSON.parse(fs.readFileSync(path.join(__dirname, 'cqls', cql_json_file), 'utf8'));
        const libraries = {
        FHIRHelpers: JSON.parse(fs.readFileSync(path.join(__dirname, 'fhir-helpers', 'v1.0.2', 'FHIRHelpers.json'), 'utf8'))
        };
        const library = new cql.Library(elmFile, new cql.Repository(libraries));

        // Create the patient source
        const patientSource = cqlfhir.PatientSource.FHIRv102();

        // Load the patient source with patients
        const bundles = [];
        // for (const fileName of fs.readdirSync(path.join(__dirname, 'patients'))) {
        //     const file = path.join(__dirname, 'patients', fileName);
        //     if (!file.endsWith('.json')) {
        //         continue;
        //     }
        //     bundles.push(JSON.parse(fs.readFileSync(file)));
        // }
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
            // Value sets are loaded, so execute!
            const executor = new cql.Executor(library, codeService);
            const results = executor.exec(patientSource);
            for (const id in results.patientResults) {
                const result = results.patientResults[id];
                console.log(`${id}:`);
                res.statusCode = 200;
                res.setHeader('Content-Type', 'application/json');
                if (postBody.request_type == 'requirements'){
                    console.log(`\tRequirements: ${result.Requirements}`);
                    res.end(JSON.stringify(result.Requirements) + '\n');
                } else if (postBody.request_type == 'decision'){
                    console.log(`\tCoverage: ${result.Coverage}`);
                    res.end(JSON.stringify({"Coverage":result.Coverage}) + '\n');
                }
            }
        })
        .catch( (err) => {
            // There was an error downloading the value sets!
            console.error('Error downloading value sets', err);
        });

    });
    
};

exports.invalidRequest = function (req, res) {
    res.statusCode = 404;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Invalid Request');
};

exports.invalidAuthorization = function (req, res) {
    res.statusCode = 401;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Invalid Authorization!!');
};