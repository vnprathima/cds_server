//Hyperbaric Oxygen Therapy
library HyperbaricOxygenTherapy

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "ICD10CM" : '2.16.840.1.113883.6.90'
codesystem "CPT" : '2.16.840.1.113883.6.12'

/*valueset "Osteomyelitis, unspecified" : '2.16.840.1.113883.3.3157.1835'
valueset "Radiation sickness, unspecified, initial encounter":'2.16.840.1.113883.3.3157.1411'
valueset "Actinomycosis, unspecified" :'2.16.840.1.113883.17.4077.2.2074'
valueset "Type 2 diabetes mellitus with other skin ulcer":'2.16.840.1.113762.1.4.1138.739'
valueset "Type 1 diabetes mellitus with other skin ulcer":'2.16.840.1.113762.1.4.1138.739'
valueset "Crushing injury of unspecified hand, initial encounter":'2.16.840.1.113883.3.3157.1411'
valueset "Complete traumatic amputation at level between left hip and knee, initial encounter":'2.16.840.1.113883.3.3157.1411'
valueset "Caisson disease [decompression sickness], initial encounter" : '2.16.840.1.113883.3.3157.1411'
valueset "Air embolism following infusion, transfusion and therapeutic injection, initial encounter" : '2.16.840.1.113883.3.3157.1411'
valueset "Gas gangrene":'2.16.840.1.113883.17.4077.2.2074'
valueset "Necrotizing fasciitis" : '2.16.840.1.113883.17.4077.2.2074'
valueset "Peripheral vascular disease, unspecified" : '2.16.840.1.113883.3.600.858'
valueset "Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter" : '2.16.840.1.113762.1.4.1146.289'
valueset "Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter" : '2.16.840.1.113883.17.4077.2.2077'*/

//General treatment (procedure)


//Hyperbaric oxygen therapy (procedure)
code "Physician attendance and supervision of hyperbaric oxygen therapy, per session code" :'99183' from  "CPT" display 'Hyperbaric oxygen therapy (procedure'
//Wagner syndrome (disorder)
code "Wegener's granulomatosis without renal involvement code" : 'M31.30' from "ICD10CM" display 'Wegeners granulomatosis without renal involvement'
//Osteoradionecrosis (disorder)
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

define "Condition1":
    {"Condition": "Osteomyelitis, unspecified"}
      
define "Condition2":
	{"Condition":"Inflammatory conditions of jaws"}

define "Condition3":
      {"Condition": "Radiation sickness, unspecified, initial encounter"}
     
define "Condition4":
    {"Condition": "Actinomycosis, unspecified" }
    
define "Condition5":
    {"Condition": "Type 1 diabetes mellitus with other skin ulcer"}
    

define "Condition6":
    {"Condition": "Type 2 diabetes mellitus with other skin ulcer"}
    
define "Condition7":
        {"Condition": "Crushing injury of unspecified hand, initial encounter",
        "Condition": "Complete traumatic amputation at level between left hip and knee, initial encounter"}

define "Condition8":
    {"Condition":"Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter" }

define "Condition9":
    {"Condition": "Caisson disease [decompression sickness], initial encounter"}

define "Condition10":
    {"Condition": "Caisson disease [decompression sickness], initial encounter"}

define "Condition11":
    {"Condition": "Air embolism following infusion, transfusion and therapeutic injection, initial encounter"}

define "Condition12":
    {"Condition": "Gas gangrene"}

define "Condition13":
    {"Condition": "Peripheral vascular disease, unspecified"}

define "Condition14":
    {"Condition": "Necrotizing fasciitis"}

define "Condition15":
    {"Condition":"Peripheral vascular disease, unspecified" }

define "Condition16":
    {"Procedure": "Under Skin Substitute Grafts"}

define "Condition17":
    {"Condition": "Toxic effect of hydrogen cyanide, intentional self-harm, initial encounter"}

define "Requirements":
    {"Condition1",{'or'},"Condition2",{'or'},"Condition3",{'or'},"Condition4",{'or'},"Condition5",{'or'},"Condition6",
	{'or'},"Condition7",{'or'},"Condition9",{'or'},"Condition10",{'or'},"Condition11",{'or'},
	"Condition12",{'or'},"Condition13",{'or'},"Condition14",{'or'},"Condition15",{'or'},"Condition16",{'or'},"Condition17"}

define "PriorAuthorization":
	//exists(["Procedure": "Physician attendance and supervision of hyperbaric oxygen therapy, per session"])
    true
