# CDS Server for cql execution

This repository is intended to include examples showing how to use the
[cql-execution](https://github.com/cqframework/cql-execution)
library.  Currently, there is a single example, demonstrating how to use `cql-execution` with the
[cql-exec-fhir](https://github.com/cqframework/cql-exec-fhir) data source and
[cql-exec-vsac](https://github.com/cqframework/cql-exec-vsac) code service.

The `cql-exec-vsac` code service requires a valid UMLS account to download value sets.  If you do not have an UMLS
account, you can request one here: https://uts.nlm.nih.gov/license.html

NOTE: These are simplified examples, designed only for the purpose of demonstrating how to use the cql-execution and
its corresponding modules.  These examples are NOT clinically validated and should NOT be used in a clinical setting.

# Setting Up the Environment

To use this project, you should perform the following steps:

1. Install [Node.js](https://nodejs.org/en/download/)
2. Run 'npm install' inside the cloned project folder
2. Run 'node server.js'

# Running the Example

The first time you run the example, It may take a while as it will download valuesets from vsac. from the second time you should get the response immediately.

To execute a CQL one should post a call with the following data:

Request URL: http://<server_url[here:localhost:3000]>/execute_cql
Request Type: application/json
Request Method: POST
Request body: {"cql":"<CQL_NAME>","request_for":"decision<String for getting the coverage decision>/requirements<String for getting the list requirements>","patientFhir":<PATIENT_DATA>}}

For Example:
{"cql":"AdultLiverTransplantation","patientFhir":{
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
}
}
