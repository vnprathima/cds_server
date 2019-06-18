library OxygenTherapy version '0.0.2'
using FHIR version '3.0.0'
include FHIRHelpers version '3.0.0' called FHIRHelpers

// This cql and questionnaire combo can be considered a partial implementation of these forms:
// https://www.cms.gov/Medicare/CMS-Forms/CMS-Forms/Downloads/CMS484.pdf
// https://www.cms.gov/Research-Statistics-Data-and-Systems/Computer-Data-and-Systems/Electronic-Clinical-Templates/Downloads/Home-Oxygen-Therapy-Order-Template-Draft-20170905-R40.pdf
// with guidance from https://www.cms.gov/Outreach-and-Education/Medicare-Learning-Network-MLN/MLNProducts/Downloads/Home-Oxygen-Therapy-ICN908804.pdf

codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'
codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "ICD10PCS": 'https://www.cdc.gov/nchs/icd/icd10cm_pcs.htm'

//measurement of pulmonary artery pressure
code "4A030B3": '4A030B3' from "ICD10PCS"

//COPD_Codes
code "J44": 'J44' from "ICD-10-CM"
code "J44.0": 'J44.0' from "ICD-10-CM"
code "J44.1": 'J44.1' from "ICD-10-CM"
code "J44.9": 'J44.9' from "ICD-10-CM"

//Bronchiectasis_Codes
code "J47": 'J47' from "ICD-10-CM"
code "J47.0": 'J47.0' from "ICD-10-CM"
code "J47.1": 'J47.1' from "ICD-10-CM"
code "J47.9": 'J47.9' from "ICD-10-CM"

//Diffuse_interstitial_lung_disease_Codes
code "J84": 'J84' from "ICD-10-CM"
code "J84.0": 'J84.0' from "ICD-10-CM"
code "J84.01": 'J84.01' from "ICD-10-CM"
code "J84.02": 'J84.02' from "ICD-10-CM"
code "J84.03": 'J84.03' from "ICD-10-CM"
code "J84.09": 'J84.09' from "ICD-10-CM"
code "J84.1": 'J84.1' from "ICD-10-CM"
code "J84.10": 'J84.10' from "ICD-10-CM"
code "J84.11": 'J84.11' from "ICD-10-CM"
code "J84.111": 'J84.111' from "ICD-10-CM"
code "J84.112": 'J84.112' from "ICD-10-CM"
code "J84.113": 'J84.113' from "ICD-10-CM"
code "J84.114": 'J84.114' from "ICD-10-CM"
code "J84.115": 'J84.115' from "ICD-10-CM"
code "J84.116": 'J84.116' from "ICD-10-CM"
code "J84.117": 'J84.117' from "ICD-10-CM"
code "J84.17": 'J84.17' from "ICD-10-CM"
code "J84.2": 'J84.2' from "ICD-10-CM"
code "J84.8": 'J84.8' from "ICD-10-CM"
code "J84.81": 'J84.81' from "ICD-10-CM"
code "J84.82": 'J84.82' from "ICD-10-CM"
code "J84.83": 'J84.83' from "ICD-10-CM"
code "J84.84": 'J84.84' from "ICD-10-CM"
code "J84.841": 'J84.841' from "ICD-10-CM"
code "J84.842": 'J84.842' from "ICD-10-CM"
code "J84.843": 'J84.843' from "ICD-10-CM"
code "J84.848": 'J84.848' from "ICD-10-CM"
code "J84.89": 'J84.89' from "ICD-10-CM"
code "J84.9": 'J84.9' from "ICD-10-CM"

//Cystic_fibrosis_Codes
code "E84": 'E84' from "ICD-10-CM"
code "E84.0": 'E84.0' from "ICD-10-CM"
code "E84.1": 'E84.1' from "ICD-10-CM"
code "E84.11": 'E84.11' from "ICD-10-CM"
code "E84.19": 'E84.19' from "ICD-10-CM"
code "E84.8": 'E84.8' from "ICD-10-CM"
code "E84.9": 'E84.9' from "ICD-10-CM"

//Pulmonary_hypertension_Codes
code "I27.0": 'I27.0' from "ICD-10-CM"
code "I27.2": 'I27.2' from "ICD-10-CM"

//Hypoxemia_Codes
code "R09.02": 'R09.02' from "ICD-10-CM"

//Secondary polycythemia(Note: can be used for Erythrocytosis)
code "D75.1": 'D75.1' from "ICD-10-CM"

//Mild cognitive impairment, so stated(Note: using for impairment of cognitive process)
code "G31.84": 'G31.84' from "ICD-10-CM"

//Restlessness and agitation(Note: using for nocturnal restlessness)
code "R45.1": 'R45.1' from "ICD-10-CM"

//Chronic tension-type headache, intractable(Note: using for morning headache)
code "G44.221": 'G44.221' from "ICD-10-CM"

//Note: using these two codes for "recurring congestive heart failure due to cor pulmonale"
//Cor pulmonale (chronic)
code "I27.81": 'I27.81' from "ICD-10-CM"
//Acute on chronic diastolic (congestive) heart failure
code "I50.33": 'I50.33' from "ICD-10-CM"

//  Loinc codes for observations
//Arterial_oxygen_saturation_Codes
code "59408-5": '59408-5' from "LOINC"
//Arterial_partial_pressure_of_oxygen_Codes
code "2703-7": '2703-7' from "LOINC"
//Arterial_oxygen_saturation_during_exercise_Codes
code "89276-0": '89276-0' from "LOINC"
//Note: cant find loinc code for partial pressure during exercise

//Hematocrit_lab_test_Codes
code "20570-8": '20570-8' from "LOINC"
code "31100-1": '31100-1' from "LOINC"
code "32354-3": '32354-3' from "LOINC"
code "41654-5": '41654-5' from "LOINC"
code "41655-2": '41655-2' from "LOINC"
code "4544-3": '4544-3' from "LOINC"
code "4545-0": '4545-0' from "LOINC"
code "71829-6": '71829-6' from "LOINC"
code "71830-4": '71830-4' from "LOINC"
code "71832-0": '71832-0' from "LOINC"
code "71833-8": '71833-8' from "LOINC"

//Malignant neoplasm of unspecified part of unspecified bronchus or lung (widespread pulmonary neoplasm)
code "C34.90": 'C34.90' from "ICD-10-CM"

//Insomnia, unspecified
code "G47.00": 'G47.00' from "ICD-10-CM"

//Dependent edema suggesting congestive heart failure
//Edema, unspecified (Note: using for Dependent edema)
code "R60.9": 'R60.9' from "ICD-10-CM"
//Right heart failure, unspecified (Note: using for congestive heart failure)
code "I50.810": 'I50.810' from "ICD-10-CM"

//Arterial Blood Gas With Oxyhemoglobin
code "82805": '82805' from "CPT"

//Cluster headache syndrome, unspecified, not intractable
code "G44.009": 'G44.009' from "ICD-10-CM"

//Inpatient Hospital stay
code "99251": '99251' from "CPT"
code "99252": '99252' from "CPT"
code "99253": '99253' from "CPT"
code "99254": '99254' from "CPT"
code "99255": '99255' from "CPT"

//Outpatient codes
code "99241": '99241' from "CPT"
code "99242": '99242' from "CPT"
code "99243": '99243' from "CPT"
code "99244": '99244' from "CPT"
code "99245": '99245' from "CPT"

//Home Oxygen Therapy_Codes
code "426990007": '426990007' from "SNOMEDCT"

//Patient's condition stable
code "359746009": '359746009' from "SNOMEDCT"

//Treatment stopped - alternative therapy undertaken (situation)
//The treating physician tried or considered alternative treatments and they were deemed clinically ineffective
code "182868002": '182868002' from "SNOMEDCT"

//Resting state (finding)
code "128975004": '128975004' from "SNOMEDCT"

//Exercise activity
code "73985-4": '73985-4' from "LOINC"

//Sleeping out (finding)
code "224229008": '224229008' from "SNOMEDCT"

parameter device_request DeviceRequest

// Relevant Diagnosis Code Lists
define "COPD_Codes": { "J44", "J44.0", "J44.1", "J44.9" }
define "Bronchiectasis_Codes": { "J47", "J47.0", "J47.1", "J47.9" }
define "Diffuse_interstitial_lung_disease_Codes": { "J84", "J84.0", "J84.01", "J84.02", "J84.03",
  "J84.09", "J84.1", "J84.10", "J84.11", "J84.111", "J84.112", "J84.113", "J84.114", "J84.115",
  "J84.116", "J84.117", "J84.17", "J84.2", "J84.8", "J84.81", "J84.82", "J84.83", "J84.84",
  "J84.841", "J84.842", "J84.843", "J84.848", "J84.89", "J84.9" }
define "Cystic_fibrosis_Codes": { "E84", "E84.0", "E84.1", "E84.11", "E84.19", "E84.8", "E84.9" }
define "Pulmonary_hypertension_Codes": { "I27.0", "I27.2" }
define "Hypoxemia_Codes": { "R09.02" }
define "Pulmonary_neoplasm_codes": { "C34.90" }
define "Erythrocytosis_Codes": { "D75.1" }
define "Mild_cognitive_impairment_Codes": { "G31.84" }
define "Restlessness_Codes": { "R45.1" }
define "Headache_codes": { "G44.221" }
define "Cor_pulmonale_Codes": { "I27.81" }
define "Congestive_heart_failure_codes": { "I50.33" }

define "Inpatient_codes" :{"99251","99252","99253","99254","99255"}

define "Outpatient_codes" :{"99241","99242","99243","99244","99245"}

define "Blood_gas_study_Codes": { "82805" }

define "Home_Oxygen_Therapy_Codes": { "426990007" }

define "Stable_condition_Codes": { "359746009" }

define "Resting_state_Codes": { "128975004"}

// Observation code lists
define "Arterial_oxygen_saturation_Codes": { "59408-5" }
define "Arterial_partial_pressure_of_oxygen_Codes": { "2703-7" }
define "Arterial_oxygen_saturation_during_exercise_Codes": { "89276-0" }

define "Hematocrit_lab_test_Codes": { "20570-8", "31100-1", "32354-3", "41654-5", "41655-2", "4544-3", "4545-0", "71829-6", "71830-4", "71832-0", "71833-8" }
	  
context Patient

define function GetMiddleInitials(name FHIR.HumanName):
  Substring(Combine((name.given given return Substring(given.value,0,1)),', '),3)


define Today: Today()

// basic patient stuff
define PatientName: singleton from (Patient.name name where name.use.value = 'official')
define PatientLastName: "PatientName".family.value
define PatientMiddleInitial: GetMiddleInitials("PatientName")
define PatientFirstName: "PatientName".given[0].value
define PatientGender: Patient.gender.value
define PatientDateOfBirth: Patient.birthDate.value

define "Indications": {
	  if exists(Confirmed(ActiveOrRecurring([Condition: "COPD_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Bronchiectasis_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Diffuse_interstitial_lung_disease_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Cystic_fibrosis_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Pulmonary_neoplasm_codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Pulmonary_hypertension_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Hypoxemia_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Erythrocytosis_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Mild_cognitive_impairment_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Restlessness_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Headache_codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Cor_pulmonale_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Congestive_heart_failure_codes"]))) then true else false
	} except { 'null' }
	
define "Blood Gas Study":
	[Procedure: "Blood_gas_study_Codes"]
	

//Considering treating physician as OrderingProvider
define "Alternate Treatment":
	(exists ([Observation: "182868002"]A 
	where  A.value = 'therapy clinically ineffective' and A.performer = OrderingProvider)
	)

//define ArterialOxygenSaturation: 
//	LowestObservation(WithUnit(Verified(ObservationLookBack([Observation: "Arterial_oxygen_saturation_Codes"], 3 months)), '%'))
	
//define ArterialPartialPressureOfOxygen: 
//	LowestObservation(WithUnit(Verified(ObservationLookBack([Observation: "Arterial_partial_pressure_of_oxygen_Codes"], 3 months)), 'mm[Hg]'))
	
//define ArterialOxygenSaturationExercise: 
//	LowestObservation(WithUnit(Verified(ObservationLookBack([Observation: "Arterial_oxygen_saturation_during_exercise_Codes"], 3 months)), '%'))

define "Group1 resting state":
	exists([Observation: "Resting_state_Codes"]) and "Group1- low values"

define "Group1- low values":
	exists[Observation:"Arterial_partial_pressure_of_oxygen_Codes"]P where P.value <= 55 'mmHg'
	or exists[Observation:"Arterial_oxygen_saturation_Codes"]G where G.value <= 88'%' 
		
define "Group1- high values":
	exists[Observation:"Arterial_partial_pressure_of_oxygen_Codes"]P  where P.value >= 56 'mmHg'
	or exists[Observation:"Arterial_oxygen_saturation_Codes"]G where G.value >= 89'%'
	
define "Group1 Exercise":
	if (exists([Observation: "Resting_state_Codes"]) and "Group1- high values")
	then (exists([Observation: "73985-4"]) 
		and "Group1- low values" )
	else false
	
define "Group1 Sleep":
	if (exists([Observation: "Resting_state_Codes"]) and "Group1- high values") 
	then ("Group1 Sleep Condition1" or "Group1 Sleep Condition2")
	else false
	
define "Group1 Sleep Condition1":
	exists([Observation: "224229008"])
	and (exists([Observation:"Arterial_partial_pressure_of_oxygen_Codes"]P where P.value <= 55 'mmHg' and P.effective>= 5 minutes)
		or exists([Observation:"Arterial_oxygen_saturation_Codes"]G where G.value <= 88'%' and P.effective>= 5 minutes)) 
	
define "Group1 Sleep Condition2":
	exists([Observation: "224229008"])
	and exists([Observation:"Arterial_partial_pressure_of_oxygen_Codes"]P  where P.value >= 56 'mmHg')
	and exists("Symptoms to hypoxemia")
	
define "Symptoms to hypoxemia":{
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Erythrocytosis_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Cor_pulmonale_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Mild_cognitive_impairment_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "G47.00"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Pulmonary_hypertension_Codes"]))) then true else false,
	  if exists(Confirmed(ActiveOrRecurring([Condition: "Hypoxemia_Codes"]))) then true else false
	} except { 'null' }

define "Group1 Criteria":
	"Group1 resting state"
	and "Group1 Exercise"
	and "Group1 Sleep"
		
define "Group2 resting state":
	 exists([Observation: "Resting_state_Codes"]) 
	 and "Group2 Conditions"
	     
			
define "Group2 Conditions":
	exists([Observation:"Arterial_oxygen_saturation_Codes"]G where G.value = 89'%')
	or (exists([Observation:"Arterial_partial_pressure_of_oxygen_Codes"]P  where P.value >= 56 'mmHg' and P.value <= 59 'mmHg')
	 	and (
	 		(exists(Confirmed(ActiveOrRecurring([Condition: "Hypoxemia_Codes"]))) and exists(Confirmed(ActiveOrRecurring([Condition: "Hypoxemia_Codes"]))))
	 		or (exists(Confirmed(ActiveOrRecurring([Condition: "Pulmonary_hypertension_Codes"]))) or exists(Confirmed(ActiveOrRecurring([Condition: "Cor_pulmonale_Codes"]))))
	 			
	 	 )
	)

define "Group2 Exercise":
	exists([Observation: "73985-4"]) 
	and "Group2 Conditions"
			 
define "Group2 Sleep":
	exists([Observation: "224229008"])
	and "Group2 Conditions"
	
define "Group2 Criteria":
	"Group2 resting state"
	and "Group2 Exercise"
	and "Group2 Sleep"	
	
define "Group3 Criteria":
	exists[Observation:"Arterial_partial_pressure_of_oxygen_Codes"]P where P.value >= 60 'mmHg'
	or exists[Observation:"Arterial_oxygen_saturation_Codes"]G where G.value >= 90'%' 
	
define  "Group Criteria":
	"Group1 Criteria"
		or "Group2 Criteria" 
		or  "Group3 Criteria"	

define "Long-term oxygen therapy":	
	(exists[Observation:"Arterial_oxygen_saturation_Codes"]G where G.value >= 89'%')
	and (exists[Observation:"Arterial_partial_pressure_of_oxygen_Codes"]P 
		where P.value >= 56 'mm of Hg' and P.value <= 65 'mm of Hg')
	
define "Cluster Headaches":
	exists [Condition: "G44.009"]C
		where C.onset in Interval[15'minutes', 180'minutes']

define "Coverage Criteria":
	(exists("Indications")
	//and "Qualifying BloodGasStudy"
	and "Alternate Treatment"
	and "Group Criteria")
	or ("Long-term oxygen therapy" and "Cluster Headaches")
	
// ordering provider info
define OrderingProvider: singleton from (
  [Practitioner] practitioner
    where ('Practitioner/' + practitioner.id) = device_request.performer.reference.value)
define OrderingProviderName: singleton from ("OrderingProvider".name name where name.use.value = 'official')
define OrderingProviderLastName: "OrderingProviderName".family.value
define OrderingProviderMiddleInitial: GetMiddleInitials("OrderingProviderName")
define OrderingProviderFirstName: "OrderingProviderName".given[0].value
define OrderingProviderNPI: (singleton from (
  "OrderingProvider".identifier identifier
    where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi')).value.value
	
	
////////////////////////////// Taken from CDS Connect Commons for FHIR, could replace with stu3 version of helper library
define function ActiveOrRecurring(CondList List<Condition>):
  CondList C where C.clinicalStatus.value in {'active', 'relapse'}
  
define function ObservationLookBack(ObsList List<Observation>, LookBack System.Quantity):
  ObsList O
    let LookBackInterval: Interval[Now() - LookBack, Now()]
    where (cast O.effective as dateTime).value in LookBackInterval
      or NullSafeToInterval(cast O.effective as Period) overlaps LookBackInterval
      or O.issued in LookBackInterval
      
define function NullSafeToInterval(Pd FHIR.Period):
  if Pd is not null then Interval[Pd."start".value, Pd."end".value] else null
  
 
define function Verified(ObsList List<Observation>):
  ObsList O where O.status.value in {'final', 'amended'}
  
define function WithUnit(ObsList List<Observation>, Unit String):
  ObsList O where (cast O.value as Quantity).unit.value = Unit or (cast O.value as Quantity).code.value = Unit
  
define function HighestObservation(ObsList List<Observation>):
  Max(ObsList O return NullSafeToQuantity(cast O.value as Quantity))
  
define function Confirmed(CondList List<Condition>):
  CondList C where C.verificationStatus.value = 'confirmed'
  
define function NullSafeToQuantity(Qty FHIR.Quantity):
  if Qty is not null then
    System.Quantity {
      value: Qty.value.value,
      unit: Coalesce(Qty.unit.value, Qty.code.value)
    }
  else null
  
define function LowestObservation(ObsList List<Observation>):
  Min(ObsList O return NullSafeToQuantity(cast O.value as Quantity))

  