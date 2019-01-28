//Hyperbaric Oxygen Therapy
library HyperbaricOxygenTherapy

using FHIR version '1.8'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "CPT":'https://www.aapc.com/resources/medical-coding/cpt.aspx'
codesystem "ICD10CM":'https://www.cdc.gov/nchs/icd/icd10cm.htm'

/*valueset "Caisson disease [decompression sickness], initial encounter" : '2.16.840.1.113883.3.3157.1411'
valueset "Air embolism following infusion, transfusion and therapeutic injection, initial encounter" : '2.16.840.1.113883.3.3157.1411'
valueset "Gas gangrene":'2.16.840.1.113883.17.4077.2.2074'
valueset "Peripheral vascular disease, unspecified":'2.16.840.1.113883.3.600.858'
valueset "Crushing injury of unspecified hand, initial encounter":'2.16.840.1.113883.3.3157.1411'
valueset "Complete traumatic amputation at level between left hip and knee, initial encounter":'2.16.840.1.113883.3.3157.1411'
valueset "Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter":'2.16.840.1.113883.3.3157.1843'
valueset "Serious or Life Threatening Illness":'2.16.840.1.113883.3.464.1003.199.12.1055'
valueset "Necrotizing fasciitis" : '2.16.840.1.113883.17.4077.2.2074'
valueset "Peripheral vascular disease, unspecified" : '2.16.840.1.113883.3.600.858'
valueset "Osteomyelitis, unspecified" : '2.16.840.1.113883.3.3157.1835'
valueset "Radiation sickness, unspecified, initial encounter":'2.16.840.1.113883.3.3157.1411'
valueset "Toxic effect of cyanides, accidental (unintentional), initial encounter":'2.16.840.1.113883.3.3157.1411'
valueset "Actinomycosis, unspecified" :'2.16.840.1.113883.17.4077.2.2074'
valueset "Type 2 diabetes mellitus with other skin ulcer":'2.16.840.1.113762.1.4.1138.739'
valueset "Type 1 diabetes mellitus with other skin ulcer":'2.16.840.1.113762.1.4.1138.739'
valueset "Sepsis due to anaerobes":'2.16.840.1.113883.17.4077.2.2044'
valueset "Clostridium perfringens [C. perfringens] as the cause of diseases classified elsewhere" : '2.16.840.1.113883.17.4077.2.2074'
valueset "Senile degeneration of brain, not elsewhere classified":'2.16.840.1.113883.3.117.1.7.1.341'
valueset "Other myocardial infarction type":'2.16.840.1.113883.3.464.1003.104.11.1003'
valueset "Sickle-cell disease without crisis":'2.16.840.1.113762.1.4.1029.34'
valueset "Acute cerebrovascular insufficiency" : '2.16.840.1.113883.3.464.1003.199.11.1103'
valueset "Other specified mental disorders due to known physiological condition" :'2.16.840.1.113762.1.4.1142.32'
valueset "Other tetanus" : '2.16.840.1.113762.1.4.1146.113'
valueset "Emphysema, unspecified":'2.16.840.1.113883.3.464.1003.102.11.1012'
valueset "Cardiogenic shock" : '2.16.840.1.113762.1.4.1029.43'
valueset "Multiple sclerosis" : '2.16.840.1.113883.3.3157.1834'
valueset "Cerebral edema" : '2.16.840.1.113883.3.666.5.1720'
valueset "Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter" : '2.16.840.1.113762.1.4.1146.289'*/

code "Physician attendance and supervision of hyperbaric oxygen therapy, per session code" :'99183' from  "CPT" display 'Hyperbaric oxygen therapy (procedure'
code "Unspecified osteoarthritis, unspecified site code" : 'M19.90' from "ICD10CM" display 'Unspecified osteoarthritis, unspecified site'
code "Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter code" : 'T58.91XA' from "ICD10CM" display 'Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter'
code "Inflammatory conditions of jaws code":'M27.2' from "ICD10CM" display 'Inflammatory conditions of jaws'
code "Wegener's granulomatosis without renal involvement code" : 'M31.30' from "ICD10CM" display 'Wegeners granulomatosis without renal involvement'
code "Soft tissue disorder, unspecified code" : 'M79.9' from "ICD10CM" display 'Soft tissue disorder, unspecified'
code "Wound Care code":'97597' from "CPT" display 'Wound Care'
code "Non-pressure chronic ulcer of skin of other sites with unspecified severity code" : 'L98.499' from "ICD10CM" display 'Non-pressure chronic ulcer of skin of other sites with unspecified severity'
code "Venous insufficiency (chronic) (peripheral) code" : 'I87.2' from "ICD10CM" display 'Venous insufficiency (chronic) (peripheral)'
code "Burn of unspecified body region, unspecified degree code" : 'T30.0' from "ICD10CM" display 'Burn of unspecified body region, unspecified degree'
code "Burns involving less than 10% of body surface code":'T31.0' from "ICD10CM" display 'Burns involving less than 10% of body surface'
code "Acute and subacute hepatic failure without coma code" : 'K72.00' from "ICD10CM" display 'Acute and subacute hepatic failure without coma'
code "Other transplanted organ and tissue status code" :'Z94.89' from "ICD10CM" display 'Other transplanted organ and tissue status'
code "Iron deficiency anemia secondary to blood loss (chronic) code" : 'D50.0' from "ICD10CM" display 'Iron deficiency anemia secondary to blood loss (chronic)'
code "Under Skin Substitute Grafts code":'15273' from "CPT" display 'Under Skin Substitute Grafts'
code "Pressure ulcer of unspecified site code" :'L89.9'from "ICD10CM" display 'Pressure ulcer of unspecified site'

code "Air embolism following infusion, transfusion and therapeutic injection, initial encounter code" :'T80.0XXA' from "ICD10CM" display 'Air embolism following infusion, transfusion and therapeutic injection, initial encounter'
code "Caisson disease [decompression sickness], initial encounter code":'T70.3XXA' from "ICD10CM" display 'Caisson disease [decompression sickness], initial encounter'
code "Gas gangrene code": 'A48.0' from "ICD10CM" display 'Gas gangrene'
code "Peripheral vascular disease, unspecified code":'I73.9' from "ICD10CM" display 'Peripheral vascular disease, unspecified'
code "Crushing injury of unspecified hand, initial encounter code" :'S67.20XA' from "ICD10CM" display 'Crushing injury of unspecified hand, initial encounter'
code "Complete traumatic amputation at level between left hip and knee, initial encounter code" : 'S78.112A' from "ICD10CM" display 'Complete traumatic amputation at level between left hip and knee, initial encounter'
code "Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter code" : 'T81.31XA' from "ICD10CM" display 'Disruption of external operation (surgical) wound, not elsewhere classified'
code "Necrotizing fasciitis code" : 'M72.6' from "ICD10CM" display 'Necrotizing fasciitis'

code "Osteomyelitis, unspecified code" : 'M86.9' from "ICD10CM" display 'Osteomyelitis, unspecified'
code "Radiation sickness, unspecified, initial encounter code" : 'T66.XXXA' from "ICD10CM" display 'Radiation sickness, unspecified, initial encounter'
code "Toxic effect of cyanides, accidental (unintentional), initial encounter code" : 'T65.0X1A' from "ICD10CM" display 'Toxic effect of cyanides, accidental (unintentional), initial encounter'
code "Actinomycosis, unspecified code" : 'A42.9' from "ICD10CM" display 'Actinomycosis, unspecified'
code "Type 2 diabetes mellitus with other skin ulcer code" : 'E11.622' from "ICD10CM" display 'Type 2 diabetes mellitus with other skin ulcer'
code "Type 1 diabetes mellitus with other skin ulcer code" : 'E10.622' from "ICD10CM" display 'Type 1 diabetes mellitus with other skin ulcer'
code "Sepsis due to anaerobes code" : 'A41.4' from "ICD10CM" display 'Sepsis due to anaerobes'
code "Clostridium perfringens [C. perfringens] as the cause of diseases classified elsewhere code" : 'B96.7' from "ICD10CM" display 'Clostridium perfringens [C. perfringens] as the cause of diseases classified elsewhere'
code "Senile degeneration of brain, not elsewhere classified code": 'G31.1' from "ICD10CM" display 'Senile degeneration of brain, not elsewhere classified'
code "Other myocardial infarction type code": 'I21.A9' from "ICD10CM" display 'Other myocardial infarction type'
code "Sickle-cell disease without crisis code": 'D57.1' from "ICD10CM" display 'Sickle-cell disease without crisis'
code "Acute cerebrovascular insufficiency code": 'I67.81' from "ICD10CM" display 'Acute cerebrovascular insufficiency'
code "Other specified mental disorders due to known physiological condition code": 'F06.8' from "ICD10CM" display 'Other specified mental disorders due to known physiological condition'
code "Other tetanus code": 'A35' from "ICD10CM" display 'Other tetanus'
code "Emphysema, unspecified code": 'J43.9' from "ICD10CM" display 'Pulmonary emphysema (disorder)'
code "Cardiogenic shock code" : 'R57.0' from "ICD10CM" display 'Cardiogenic shock'
code "Multiple sclerosis code": 'G35' from "ICD10CM" display 'Multiple sclerosis'
code "Cerebral edema code": 'G93.6' from "ICD10CM" display 'Cerebral edema'
code "Other specified cerebrovascular diseases code":'I67.8' from "ICD10CM" display 'Other specified cerebrovascular diseases'

concept "Physician attendance and supervision of hyperbaric oxygen therapy, per session":{"Physician attendance and supervision of hyperbaric oxygen therapy, per session code"} display 'Physician attendance and supervision of hyperbaric oxygen therapy, per session'
concept "Unspecified osteoarthritis, unspecified site": {"Unspecified osteoarthritis, unspecified site code"} display 'Unspecified osteoarthritis, unspecified site'
concept "Wegener's granulomatosis without renal involvement":{"Wegener's granulomatosis without renal involvement code"} display 'Wegeners granulomatosis without renal involvement code'
concept "Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter":{"Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter code"} display 'Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter'
concept "Inflammatory conditions of jaws": {"Inflammatory conditions of jaws code"} display 'Inflammatory conditions of jaws'
concept "Soft tissue disorder, unspecified":{"Soft tissue disorder, unspecified code"} display 'Soft tissue disorder, unspecified'
concept "Wound Care" : {"Wound Care code"} display 'Wound Care'
concept "Non-pressure chronic ulcer of skin of other sites with unspecified severity" : {"Non-pressure chronic ulcer of skin of other sites with unspecified severity code"} display 'Non-pressure chronic ulcer of skin of other sites with unspecified severity'
concept "Venous insufficiency (chronic) (peripheral)" : {"Venous insufficiency (chronic) (peripheral) code"} display 'Venous insufficiency (chronic) (peripheral)'
concept "Burn of unspecified body region, unspecified degree" : {"Burn of unspecified body region, unspecified degree code"} display 'Burn of unspecified body region, unspecified degree'
concept "Burns involving less than 10% of body surface" : {"Burns involving less than 10% of body surface code"} display 'Burns involving less than 10% of body surface'
concept "Acute and subacute hepatic failure without coma" : {"Acute and subacute hepatic failure without coma code"} display 'Acute and subacute hepatic failure without coma'
concept "Other transplanted organ and tissue status" : {"Other transplanted organ and tissue status code"} display 'Other transplanted organ and tissue status'
concept "Iron deficiency anemia secondary to blood loss (chronic)":{"Iron deficiency anemia secondary to blood loss (chronic) code"} display 'Iron deficiency anemia secondary to blood loss (chronic)'
concept "Under Skin Substitute Grafts" : {"Under Skin Substitute Grafts code"} display 'Under Skin Substitute Grafts'
concept "Pressure ulcer of unspecified site" : {"Pressure ulcer of unspecified site code"} display 'Pressure ulcer of unspecified site'

concept "Caisson disease [decompression sickness], initial encounter" : {"Caisson disease [decompression sickness], initial encounter code"} display 'Caisson disease [decompression sickness], initial encounter'
concept "Air embolism following infusion, transfusion and therapeutic injection, initial encounter":{"Air embolism following infusion, transfusion and therapeutic injection, initial encounter code"} display 'Air embolism following infusion, transfusion and therapeutic injection, initial encounter'
concept "Gas gangrene" : {"Gas gangrene code"} display 'Gas gangrene'
concept "Peripheral vascular disease, unspecified" : {"Peripheral vascular disease, unspecified code"} display 'Peripheral vascular disease, unspecified'
concept "Crushing injury of unspecified hand, initial encounter":{"Crushing injury of unspecified hand, initial encounter code"} display 'Crushing injury of unspecified hand, initial encounter'
concept "Complete traumatic amputation at level between left hip and knee, initial encounter":{"Complete traumatic amputation at level between left hip and knee, initial encounter code"} display 'Complete traumatic amputation at level between left hip and knee, initial encounter'
concept "Necrotizing fasciitis" : {"Necrotizing fasciitis code"} display 'Necrotizing fasciitis'
concept "Osteomyelitis, unspecified": {"Osteomyelitis, unspecified code"} display 'Osteomyelitis, unspecified'
concept "Radiation sickness, unspecified, initial encounter" :{"Radiation sickness, unspecified, initial encounter code"} display 'Radiation sickness, unspecified, initial encounter'
concept "Toxic effect of cyanides, accidental (unintentional), initial encounter" : {"Toxic effect of cyanides, accidental (unintentional), initial encounter code"} display 'Toxic effect of cyanides, accidental (unintentional), initial encounter'
concept "Actinomycosis, unspecified" : {"Actinomycosis, unspecified code"} display 'Actinomycosis, unspecified'
concept "Type 1 diabetes mellitus with other skin ulcer" : {"Type 1 diabetes mellitus with other skin ulcer code"} display 'Type 1 diabetes mellitus with other skin ulcer'
concept "Type 2 diabetes mellitus with other skin ulcer" : {"Type 2 diabetes mellitus with other skin ulcer code"} display 'Type 2 diabetes mellitus with other skin ulcer'
concept "Sepsis due to anaerobes" : {"Sepsis due to anaerobes code"} display 'Sepsis due to anaerobes'
concept "Clostridium perfringens [C. perfringens] as the cause of diseases classified elsewhere": {"Clostridium perfringens [C. perfringens] as the cause of diseases classified elsewhere code"} display 'Clostridium perfringens [C. perfringens] as the cause of diseases classified elsewhere'
concept "Senile degeneration of brain, not elsewhere classified" : {"Senile degeneration of brain, not elsewhere classified code"} display 'Senile degeneration of brain, not elsewhere classified'
concept "Other myocardial infarction type" : {"Other myocardial infarction type code"} display 'Other myocardial infarction type'
concept "Cardiogenic shock" : {"Cardiogenic shock code"} display 'Cardiogenic shock'
concept "Sickle-cell disease without crisis": {"Sickle-cell disease without crisis code"} display 'Sickle-cell disease without crisis'
concept "Acute cerebrovascular insufficiency":{"Acute cerebrovascular insufficiency code"} display 'Acute cerebrovascular insufficiency'
concept "Other specified mental disorders due to known physiological condition" : {"Other specified mental disorders due to known physiological condition code"} display 'Other specified mental disorders due to known physiological condition'
concept "Other tetanus" : {"Other tetanus code"} display 'Other tetanus'
concept "Emphysema, unspecified" : {"Emphysema, unspecified code"} display 'Emphysema, unspecified'
concept "Multiple sclerosis": {"Multiple sclerosis code"}  display 'Multiple sclerosis'
concept "Cerebral edema": {"Cerebral edema code"}  display 'Cerebral edema'
concept "Other specified cerebrovascular diseases":{"Other specified cerebrovascular diseases code"} display 'Other specified cerebrovascular diseases'


context Patient
define "Method":
	(exists["Procedure":"Physician attendance and supervision of hyperbaric oxygen therapy, per session"])
		
define "Condition1":
    exists(["Condition" :"Crushing injury of unspecified hand, initial encounter"])
    and exists(["Condition" :"Complete traumatic amputation at level between left hip and knee, initial encounter"])

define "Condition2":
    exists(["Condition":"Inflammatory conditions of jaws"])
  
define "Condition3":
    exists(["Condition":"Radiation sickness, unspecified, initial encounter"])
  

define "Condition4":
    exists(["Condition":"Actinomycosis, unspecified"])
    

define "Condition5":
   (exists(["Condition":"Type 2 diabetes mellitus with other skin ulcer"])
    or exists(["Condition": "Type 1 diabetes mellitus with other skin ulcer"]))
    and exists(["Condition":"Wegener's granulomatosis without renal involvement"])
    and exists(["Procedure":"Wound Care"])
    
define "Condition6":
	(exists["Condition":"Toxic effect of carbon monoxide from unspecified source, accidental (unintentional), initial encounter"])
	
define "Condition7":
	(exists["Condition" :"Caisson disease [decompression sickness], initial encounter"])
	
define "Condition8":
	(exists["Condition" :"Air embolism following infusion, transfusion and therapeutic injection, initial encounter"])
	
define "Condition9":
	(exists["Condition" :"Gas gangrene"])
	
define "Condition10":
	 (exists["Condition" :"Peripheral vascular disease, unspecified"])
	 
define "Condition11":
	 (exists["Condition" :"Necrotizing fasciitis"])
	 

                   
define "Condition12":
                   (exists["Procedure" :"Under Skin Substitute Grafts"])
                   
define "Condition13" :
                  (exists["Condition" :"Osteomyelitis, unspecified"])	
                  
 define "Condition14":
 	         (exists(["Condition":"Toxic effect of cyanides, accidental (unintentional), initial encounter"]))        

define "Covered":
    if("Method"  and
     ("Condition6" or "Condition7" or "Condition8" or  
      "Condition9" or "Condition10" or  "Condition1" or  
      "Condition11" or "Condition12"  or "Condition13" or
      "Condition2"  or  "Condition3"   or "Condition14"  or  "Condition4"   or  "Condition5") )
    	                                                  
                        
    then 
    		true
    else
    		false
    		
    				
define "Coverage":
	if "Covered" is true then 'true' else 'false because Conditions are not appropriate'
