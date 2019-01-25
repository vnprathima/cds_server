//Hyperbaric Oxygen Therapy
library HyperbaricOxygenTherapy

using FHIR 
include FHIRHelpers version '1.8' called FHIRHelpers


//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "ICD10CM" : '2.16.840.1.113883.6.90'
codesystem "CPT" : '2.16.840.1.113883.6.12'

code "Physician attendance and supervision of hyperbaric oxygen therapy, per session code" :'99183' from  "CPT" display 'Hyperbaric oxygen therapy (procedure'

code "Osteomyelitis, unspecified code" : 'M86.9' from "ICD10CM" display 'Osteomyelitis, unspecified'
code "Inflammatory conditions of jaws code":'M27.2' from "ICD10CM" display 'Inflammatory conditions of jaws'
code "Radiation sickness, unspecified, initial encounter code" : 'T66.XXXA' from "ICD10CM" display 'Radiation sickness, unspecified, initial encounter'
code "Actinomycosis, unspecified code" : 'A42.9' from "ICD10CM" display 'Actinomycosis, unspecified'
code "Type 2 diabetes mellitus with other skin ulcer code" : 'E11.622' from "ICD10CM" display 'Type 2 diabetes mellitus with other skin ulcer'
code "Type 1 diabetes mellitus with other skin ulcer code" : 'E10.622' from "ICD10CM" display 'Type 1 diabetes mellitus with other skin ulcer'

//Grade III
code "Cutaneous abscess, unspecified code" : 'L02.91' from "ICD10CM" display 'Cutaneous abscess, unspecified'
code "Pyogenic arthritis, unspecified code" : 'M00.9' from "ICD10CM" display 'Pyogenic arthritis, unspecified'
code "Cutaneous abscess of left foot code" : 'L02.612' from "ICD10CM" display 'Cutaneous abscess of left foot'
code "Abscess of tendon sheath, unspecified site code" : 'M65.00' from "ICD10CM" display 'Abscess of tendon sheath, unspecified site'
code "Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter code":'T81.31XA' from "ICD10CM" display 'Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter'
code "Wound Care code":'97597' from "CPT" display 'Wound Care'

concept "Osteomyelitis, unspecified": {"Osteomyelitis, unspecified code"} display 'Osteomyelitis, unspecified'
concept "Inflammatory conditions of jaws": {"Inflammatory conditions of jaws code"} display 'Inflammatory conditions of jaws'
concept "Radiation sickness, unspecified, initial encounter" :{"Radiation sickness, unspecified, initial encounter code"} display 'Radiation sickness, unspecified, initial encounter'
concept "Actinomycosis, unspecified" : {"Actinomycosis, unspecified code"} display 'Actinomycosis, unspecified'
concept "Type 1 diabetes mellitus with other skin ulcer" : {"Type 1 diabetes mellitus with other skin ulcer code"} display 'Type 1 diabetes mellitus with other skin ulcer'
concept "Type 2 diabetes mellitus with other skin ulcer" : {"Type 2 diabetes mellitus with other skin ulcer code"} display 'Type 2 diabetes mellitus with other skin ulcer'
concept "Cutaneous abscess, unspecified" : {"Cutaneous abscess, unspecified code"} display 'Cutaneous abscess, unspecified'
concept "Pyogenic arthritis, unspecified":{"Pyogenic arthritis, unspecified code"} display 'Pyogenic arthritis, unspecified'
concept "Cutaneous abscess of left foot":{"Cutaneous abscess of left foot code"} display 'Cutaneous abscess of left foot'
concept "Abscess of tendon sheath, unspecified site" : {"Abscess of tendon sheath, unspecified site code"} display 'Abscess of tendon sheath, unspecified site'
concept "Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter" : {"Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter code"} display 'Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter'
concept "Wound Care" : {"Wound Care code"} display 'Wound Care'
concept "Physician attendance and supervision of hyperbaric oxygen therapy, per session":{"Physician attendance and supervision of hyperbaric oxygen therapy, per session code"} display 'Physician attendance and supervision of hyperbaric oxygen therapy, per session'
parameter MeasurementPeriod Interval<DateTime>
parameter MeasurementPeriod1 default @2015-04-13T00:00:00.0
parameter MeasurementPeriod2 default @2015-08-01T00:00:00.0
context Patient

define "WagnerGradeIII":
      (exists (["Condition":"Cutaneous abscess, unspecified"])
      and (exists (["Condition" :"Pyogenic arthritis, unspecified"]))
      and (exists (["Condition":"Cutaneous abscess of left foot"]))
      or (exists (["Condition":"Abscess of tendon sheath, unspecified site"]))
      )
      
define "DiabeticConditions":
		(exists(["Condition":"Type 1 diabetes mellitus with other skin ulcer"]))
            or (exists(["Condition":"Type 2 diabetes mellitus with other skin ulcer"]))
            and "WagnerGradeIII"
            and (exists (["Procedure":"Wound Care"])
            and (exists (["Condition":"Disruption of external operation (surgical) wound, not elsewhere classified, initial encounter"])))
            
define "Condition":
		(exists(["Condition":"Osteomyelitis, unspecified"])
		or (exists (["Condition":"Inflammatory conditions of jaws"]))
		or  (exists(["Condition":"Radiation sickness, unspecified, initial encounter"]))
		or (exists (["Condition" :"Actinomycosis, unspecified"]))
		or "DiabeticConditions")
		
		
define "PriorAuthorizationAffirmed":
		if(exists (["Procedure":"Physician attendance and supervision of hyperbaric oxygen therapy, per session"]P where P.performed during MeasurementPeriod)and
		Count(["Procedure":"Physician attendance and supervision of hyperbaric oxygen therapy, per session"]) < 40)
		then
				
			"Condition"
		else
		       false
		       
define "Facilities&Beneficiaries":
		{"HealthcareService.location":'Michigan'}
		
define "Facilities&Beneficiaries1":
		{"HealthcareService.location":'New Jersey'}
define "Facilities&Beneficiaries2":		
		{ "HealthcareService.location":'Illinois' }
		
define"Facilities":
	{"Facilities&Beneficiaries1",{'or'},"Facilities&Beneficiaries2"}
			       
define "Condition1":
	if(exists ["Procedure":"Physician attendance and supervision of hyperbaric oxygen therapy, per session"]P where P.performed on or after MeasurementPeriod1)
		then
			"PriorAuthorizationAffirmed"
		else
			false	
define "Condition2":
	if(exists ["Procedure":"Physician attendance and supervision of hyperbaric oxygen therapy, per session"]P where P.performed on or after MeasurementPeriod2)
		then
			"PriorAuthorizationAffirmed"
		else
			false		

	
define "Decision1":
	  exists("Facilities&Beneficiaries") and (exists ["Procedure":"Physician attendance and supervision of hyperbaric oxygen therapy, per session"]P where P.performed on or after MeasurementPeriod1)

define "Decision2":
		exists("Facilities&Beneficiaries") and "Condition1"
					
define "Inclusion1":
		"Decision1" or "Decision2"
		
define "Decision3":
	  exists("Facilities") and (exists ["Procedure":"Physician attendance and supervision of hyperbaric oxygen therapy, per session"]P where P.performed on or after MeasurementPeriod2)

define "Decision4":
		exists("Facilities") and "Condition1"
		
define "Inclusion2":
		"Decision3" or "Decision4"
		
define "Inclusions":
		"Inclusion1" or "Inclusion2"
		
define "Claim1":
		{"Claim.payee.party":'facilities'}
		
define "Claim2":
		{"Claim.payee.party":'beneficiaries'}
		
define "Claim3":
		{"Claim.payee.party":'Zone Program Integrity Contractor'}
		
define "PriorAuthorization":
	if(exists(Claim1) or (exists(Claim2)))
	then
		"Inclusions"
	else
		false
		
define "NoPriorAthorization":
	if(exists(Claim3))
	then
		not "Inclusions"
	else
		false
		
define "Covered":
	"PriorAuthorization" and "NoPriorAthorization"
