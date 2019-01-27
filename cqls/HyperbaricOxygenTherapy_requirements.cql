//Hyperbaric Oxygen
library HyperbaricOxygenTherapy

using FHIR version '1.8'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "ICD10CM" : '2.16.840.1.113883.6.90'
codesystem "CPT" : '2.16.840.1.113883.6.12'
codesystem "LONIC":'2.16.840.1.113883.6.1'

code "Physician attendance and supervision of hyperbaric oxygen therapy, per session code" :'99183' from  "CPT" display 'Hyperbaric oxygen therapy (procedure'
code "Wegener's granulomatosis without renal involvement code" : 'M31.30' from "ICD10CM" display 'Wegeners granulomatosis without renal involvement'
code "Inflammatory conditions of jaws code":'M27.2' from "ICD10CM" display 'Inflammatory conditions of jaws'
code "Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter code" : 'T58.91XA' from "ICD10CM" display 'Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter'
code "Osteomyelitis, unspecified code" : 'M86.9' from "ICD10CM" display 'Osteomyelitis, unspecified'
code "Radiation sickness, unspecified, initial encounter code" : 'T66.XXXA' from "ICD10CM" display 'Radiation sickness, unspecified, initial encounter'
code "Actinomycosis, unspecified code" : 'A42.9' from "ICD10CM" display 'Actinomycosis, unspecified'
code "Type 2 diabetes mellitus with other skin ulcer code" : 'E11.622' from "ICD10CM" display 'Type 2 diabetes mellitus with other skin ulcer'
code "Type 1 diabetes mellitus with other skin ulcer code" : 'E10.622' from "ICD10CM" display 'Type 1 diabetes mellitus with other skin ulcer'
code "Crushing injury of unspecified hand, initial encounter code" :'S67.20XA' from "ICD10CM" display 'Crushing injury of unspecified hand, initial encounter'
code "Complete traumatic amputation at level between left hip and knee, initial encounter code" : 'S78.112A' from "ICD10CM" display 'Complete traumatic amputation at level between left hip and knee, initial encounter'
code "Caisson disease [decompression sickness], initial encounter code":'T70.3XXA' from "ICD10CM" display 'Caisson disease [decompression sickness], initial encounter'
code "Air embolism following infusion, transfusion and therapeutic injection, initial encounter	code" : 'T80.0XXA' from "ICD10CM" display 'Air embolism following infusion, transfusion and therapeutic injection, initial encounter'
code "Gas gangrene code": 'A48.0' from "ICD10CM" display 'Gas gangrene'
code "Peripheral vascular disease, unspecified code":'I73.9' from "ICD10CM" display 'Peripheral vascular disease, unspecified'
code "Necrotizing fasciitis code" : 'M72.6' from "ICD10CM" display 'Necrotizing fasciitis'
code "Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter code" :'T57.3X2A' from "ICD10CM" display 'Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter'
code "Air embolism following infusion, transfusion and therapeutic injection, initial encounter code": 'T80.0XXA' from "ICD10CM" display 'Air embolism following infusion, transfusion and therapeutic injection, initial encounter'
code "Under Skin Substitute Grafts code":'15273' from "CPT" display 'Under Skin Substitute Grafts'
code "Wound Care code":'97597' from "CPT" display 'Wound Care'
code "Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter code":'T81.31XA' from "ICD10CM" display 'Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter'
//code "National provider ID code":'45952-9' from "LOINC" display 'National provider ID'
//General treatment (procedure)

//concept "National provider ID" : {"National provider ID code"} display 'National provider ID'
concept "Wound Care" : {"Wound Care code"} display 'Wound Care'
concept "Physician attendance and supervision of hyperbaric oxygen therapy, per session":{"Physician attendance and supervision of hyperbaric oxygen therapy, per session code"} display 'Physician attendance and supervision of hyperbaric oxygen therapy, per session'
concept "Osteomyelitis, unspecified": {"Osteomyelitis, unspecified code"} display 'Osteomyelitis, unspecified'
concept "Radiation sickness, unspecified, initial encounter" :{"Radiation sickness, unspecified, initial encounter code"} display 'Radiation sickness, unspecified, initial encounter'
concept "Actinomycosis, unspecified" : {"Actinomycosis, unspecified code"} display 'Actinomycosis, unspecified'
concept "Type 1 diabetes mellitus with other skin ulcer" : {"Type 1 diabetes mellitus with other skin ulcer code"} display 'Type 1 diabetes mellitus with other skin ulcer'
concept "Type 2 diabetes mellitus with other skin ulcer" : {"Type 2 diabetes mellitus with other skin ulcer code"} display 'Type 2 diabetes mellitus with other skin ulcer'
concept "Crushing injury of unspecified hand, initial encounter":{"Crushing injury of unspecified hand, initial encounter code"} display 'Crushing injury of unspecified hand, initial encounter'
concept "Complete traumatic amputation at level between left hip and knee, initial encounter":{"Complete traumatic amputation at level between left hip and knee, initial encounter code"} display 'Complete traumatic amputation at level between left hip and knee, initial encounter'
concept "Caisson disease [decompression sickness], initial encounter" : {"Caisson disease [decompression sickness], initial encounter code"} display 'Caisson disease [decompression sickness], initial encounter'
concept "Air embolism following infusion, transfusion and therapeutic injection, initial encounter" : {"Air embolism following infusion, transfusion and therapeutic injection, initial encounter code"} display 'Air embolism following infusion, transfusion and therapeutic injection, initial encounter'
concept "Gas gangrene" : {"Gas gangrene code"} display 'Gas gangrene'
concept "Peripheral vascular disease, unspecified" : {"Peripheral vascular disease, unspecified code"} display 'Peripheral vascular disease, unspecified'
concept "Necrotizing fasciitis" : {"Necrotizing fasciitis code"} display 'Necrotizing fasciitis'
concept "Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter" : {"Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter code"}  display 'Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter'
concept "Inflammatory conditions of jaws": {"Inflammatory conditions of jaws code"} display 'Inflammatory conditions of jaws'
concept "Wegener's granulomatosis without renal involvement":{"Wegener's granulomatosis without renal involvement code"} display 'Wegeners granulomatosis without renal involvement code'
concept "Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter":{"Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter code"} display 'Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter'
concept "Under Skin Substitute Grafts" : {"Under Skin Substitute Grafts code"} display 'Under Skin Substitute Grafts'
concept "Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter": {"Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter code"} display 'Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter'

define "Condition1":
    {"Condition":{
        "code":  "Osteomyelitis, unspecified"}
    }

define "Condition2":
	{"Condition":{
        "code":  "Inflammatory conditions of jaws"}
    }

define "Condition3":
      {"Condition": {
        "code":  "Radiation sickness, unspecified, initial encounter"}
    }

define "Condition4":
    {"Condition": {
        "code":  "Actinomycosis, unspecified" }
    }

define "Condition5":
    {"Condition": {
        "code":  "Type 1 diabetes mellitus with other skin ulcer"}
    }

define "Condition6":
    {"Condition": {
        "code":  "Type 2 diabetes mellitus with other skin ulcer"}
    }

define "Condition7":
    {"Condition":{
        "code":   "Crushing injury of unspecified hand, initial encounter"} ,
        "Condition": {
        "code":  "Complete traumatic amputation at level between left hip and knee, initial encounter"}
    }

define "Condition8":
    {"Condition":{
        "code":  "Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter" }
    }

define "Condition9":
    {"Condition": {
        "code":  "Caisson disease [decompression sickness], initial encounter"}
    }

define "Condition10":
    {"Condition": {
        "code":  "Air embolism following infusion, transfusion and therapeutic injection, initial encounter"}
    }

define "Condition11":
    {"Condition":{
        "code":   "Gas gangrene"}
    }

define "Condition12":
    {"Condition": {
        "code":  "Peripheral vascular disease, unspecified"}
    }

define "Condition13":
    {"Condition": {
        "code":  "Necrotizing fasciitis"}
    }

define "Condition14":
    {"Procedure":{
        "code":   "Under Skin Substitute Grafts"}
    }

define "Condition15":
    {"Condition":{
        "code":   "Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter"}
    }

define "Condition16":
    {"Condition": {
        "code":  "Wegener's granulomatosis without renal involvement"}
    }

define "Condition17":
    {"Procedure":{
        "code":  "Wound Care"},
    "Condition":{
        "code":  "Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter"}
    }


define "Documents":
    {'Signed Physician Orders',
    'https://www.cms.gov/Medicare/CMS-Forms/CMS-Forms/downloads/CMS484.pdf',
    'HBO progress notes (including measurable signs of healing)',
    'HBO treatment log with documented length of treatment time',
    'Results of all testing/services billed',
    'Documentation of physician attendance and supervision of HBO therapy',
    'Itemized bill'}

define "Requirements":
      {
	"Codes":{
		   "Condition1",{'or'},
		   "Condition2",{'or'},
		   "Condition3",{'or'},
		   "Condition4",{'or'},
		   "Condition5",{'or'},
		   "Condition6",{'or'},
		   "Condition7",{'or'},
		   "Condition9",{'or'},
		   "Condition10",{'or'},
		   "Condition11",{'or'},
           "Condition12",{'or'},
           "Condition13",{'or'},
           "Condition14",{'or'},
           "Condition16",{'or'},
           "Condition17"
        },
	"DocumentsToAttach":{
			"Documents"
		}
	}

 define "BeneficiaryInformation":
 	{"Patient":{
 			"name":'Beneficiary Name',
    	 		"identifier":'Beneficiary Medicare Number',
    			"birthDate":'Beneficiary Date of Birth',
         		"gender":'Beneficiary Gender'
         	   }
         }

define "OrderingPhysician/PractitionerInformation":
    {"Practitioner":{
    			"name":'Physician or Practitioner Name',
    			"identifier":'National provider ID',
    			"address":'Physician or Practitioner Address'
    		   }
   }

define "FacilityInformation":
    {"Organization":{
            "name": 'Facility Name',
            "identifier":'National provider ID',
            "address":'Facility Address'
        }
    }

define "RequestorInformation":
	{"Claim":
    		{
   			"enterer":{
   			    "name":'Contact Name',
   			    "phone":'Telephone Number'
   			    }
   			}
   	}


define "OtherInformation":
    {"Claim":{
    		"procedure":'Number of treatments requested',
    		"item":{
                "quantity":'Number of units per treatment requested'
                },
   		    "created":'Submission Date',
    		"procedure":{
    		    "date":'Start Date of the 12 month period'
    		    },
    		"state":'State',
    		"diagnosis":{
                "diagnosis":{
                    "diagnosisCodeableConcept":'Diagnosis code'
                    }
                }
    		}
    	}

define "DocumentsInForm":
    {"FormRequest":{
		       "checkbox": 'Indicate if the request is an initial or resubmission review',
		       "text": 'Indicate if the request is expedited and the reason why'
		    }
	}

define "PriorAuthorization":
	'Optional'

define "PriorAuthorizationRequirements":
   {"Codes":{
            "Condition1",{'or'},
            "Condition2",{'or'},
            "Condition3",{'or'},
            "Condition4",{'or'},
            "Condition5",{'or'},
            "Condition6",{'or'},
            "Condition16",{'or'},
            "Condition17"
	    },
	"DocumentsFromFHIR": {
            "BeneficiaryInformation",
            "OrderingPhysician/PractitionerInformation",
            "FacilityInformation",
            "RequestorInformation",
            "OtherInformation"
	    },
	"InfoFromForm": {
	        "DocumentsInForm"
	    }
    }
