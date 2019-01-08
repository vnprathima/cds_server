const fs = require('fs');
const path = require('path');
const cql = require('cql-execution');
const cqlfhir = require('cql-exec-fhir');
const cqlvsac = require('cql-exec-vsac');

let vsacUser, vsacPass;
// if (process.argv.length == 4) {
//   [vsacUser, vsacPass] = process.argv.slice(2);
// }
[vsacUser, vsacPass] = ["prathyanusha","Anusha56"];

console.log('/-------------------------------------------------------------------------------');
console.log('| Example:   Adult Liver Transplantation');
if (vsacUser) {
  console.log('| VSAC User:', vsacUser);
}
console.log('\\-------------------------------------------------------------------------------');

// Set up the library
const elmFile = JSON.parse(fs.readFileSync(path.join(__dirname, 'cqls', 'HyperbaricOxygenTherapy_requirements.json'), 'utf8'));
const libraries = {
  FHIRHelpers: JSON.parse(fs.readFileSync(path.join(__dirname,  'fhir-helpers', 'v1.0.2', 'FHIRHelpers.json'), 'utf8'))
};
const library = new cql.Library(elmFile, new cql.Repository(libraries));

// Create the patient source
const patientSource = cqlfhir.PatientSource.FHIRv102();

// Load the patient source with patients
const bundles = [];
// for (const fileName of fs.readdirSync(path.join(__dirname, 'patients'))) {
//   const file = path.join(__dirname, 'patients', fileName);
//   if (!file.endsWith('.json')) {
//     continue;
//   }
//   bundles.push(JSON.parse(fs.readFileSync(file)));
// }
// patientSource.loadBundles(bundles);
bundles.push({
  "resourceType": "Bundle",
  "id": "Prathima",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "id": "Prathima",
        "gender": "female",
        "birthDate": "2008-09-18"
      }
    },
    {
      "resource": {
        "resourceType": "Condition",
        "id": "6-1",
        "clinicalStatus": "active",
        "verificationStatus": "confirmed",
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "708248004",
              "display": "End Stage Liver Disease (disorder)"
            }
          ]
        },
        "subject": {
          "reference": "Patient/Prathima"
        },
        "onsetDateTime": "2017-05-30"
      }
    },
    {
      "resource": {
        "resourceType": "Procedure",
        "id": "6-2",
        "subject": {
          "reference": "Patient/Prathima"
        },
        "status": "completed",
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "18027006",
              "display": "Transplantation of liver (procedure)"
            }
          ]
        },
        "performedDateTime": "2017-05-30"
      }
    }
  ]
});
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
      console.log("REsult:",result.Requirements);
    }
  })
  .catch( (err) => {
    // There was an error downloading the value sets!
    console.error('Error downloading value sets', err);
  });
