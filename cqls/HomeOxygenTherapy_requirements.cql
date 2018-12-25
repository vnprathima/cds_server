library HomeOxygenTherapy version '1'

using FHIR version '1.8'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "EntityNamePartQualifier": '2.16.840.1.113883.11.20.9.26'
codesystem "LOINC": '2.16.840.1.113762.1.4.1099.13'
codesystem "NUCCPT":'2.16.840.1.114222.4.11.1066'




code "Equipment related features (finding) code": '405655001' from "SNOMEDCT" display 'Equipment related features (finding)'
code "Equipment requirement (finding) code": '698532002' from "SNOMEDCT" display 'Equipment requirement (finding)'
code "Equipment in use (finding) code": '397917005' from "SNOMEDCT" display 'Equipment in use (finding)'
code "Durable medical equipment education, guidance, and counseling (procedure) code": '410286008' from "SNOMEDCT" display 'Durable medical equipment education, guidance, and counseling (procedure)'
code "Past history of procedure (situation) code": '416940007' from "SNOMEDCT" display 'Past history of procedure (situation)'
code "Functional movement disorder (disorder) code": '718362003' from "SNOMEDCT" display 'Functional movement disorder (disorder)'
code "Secondary diagnosis code": '81885-6' from "LOINC" display 'Secondary diagnosis'
code "Primary diagnosis code": '18630-4' from "LOINC" display 'Primary diagnosis'
code "Procedure aiding diagnosis (procedure) code": '165167006' from "SNOMEDCT" display 'Procedure aiding diagnosis (procedure)'
code "Blood gas analysis (procedure) code": '278297009' from "SNOMEDCT" display 'Blood gas analysis (procedure)'
code "Encounter Face to Face code": '20160302' from "SNOMEDCT" display 'Encounter Face to Face'
code "Seen by physician (finding) code": '305660003' from "SNOMEDCT" display 'Seen by physician (finding)'
code "Seen by clinical nurse specialist (finding) code": '305733002' from "SNOMEDCT" display 'Seen by clinical nurse specialist (finding)'
code "Seen by nurse practitioner (finding) code": '305757002' from "SNOMEDCT" display 'Seen by nurse practitioner (finding)'
code "Referred by physician assistant (finding) code": '2051000124106' from "SNOMEDCT" display 'Referred by physician assistant (finding)'
code "Home oxygen therapy (procedure) code": '426990007' from "SNOMEDCT" display 'Home oxygen therapy (procedure)'
code "Encounter Inpatient code": '20170504' from "SNOMEDCT" display 'Encounter Inpatient'
code "Encounter Hospital Outpatient code": '20151013' from "SNOMEDCT" display 'Encounter Hospital Outpatient'
code "initial code": 'IN' from "EntityNamePartQualifier" display 'initial'
code "title code": 'TITLE' from "EntityNamePartQualifier" display 'title'
code "Checking patient identity (procedure) code": '710958003' from "SNOMEDCT" display 'Checking patient identity (procedure)'
code "Confirming patient identity prior to procedure (procedure) code": '372040007' from "SNOMEDCT" display 'Confirming patient identity prior to procedure (procedure)'
code "Attending physician (occupation) code": '405279007' from "SNOMEDCT" display 'Attending physician (occupation)'
code "National provider ID code": '45952-9' from "LOINC" display 'National provider ID'
code "Illness (finding) code": '39104002' from "SNOMEDCT" display 'Illness (finding)'
code "Patient's condition worsened (finding) code": '271299001' from "SNOMEDCT" display 'Patients condition worsened (finding)'
code "Patient's condition improved (finding) code": '268910001' from "SNOMEDCT" display 'Patients condition improved (finding)'
code "Conditional prognosis (finding) code": '60484009' from "SNOMEDCT" display 'Conditional prognosis (finding)'
code "Mobile in home (finding) code": '302000008' from "SNOMEDCT" display 'Mobile in home (finding)'
code "Gathering of past medical history (procedure) code": '451571000124102' from "SNOMEDCT" display 'Gathering of past medical history (procedure)'
code "Therapeutic regimen (regime/therapy) code": '133877004' from "SNOMEDCT" display 'Therapeutic regimen (regime/therapy)'
code "Administration of prescribed medications based on arterial blood gas results (procedure) code": '370774005' from "SNOMEDCT" display 'Administration of prescribed medications based on arterial blood gas results (procedure)'
code "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code": '261QF0400X' from "NUCCPT" display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
code "Evaluating interventions (procedure) code": '225303001' from "SNOMEDCT" display 'Evaluating interventions (procedure)'

concept "Equipment related features (finding)": {"Equipment related features (finding) code"} display 'Equipment related features (finding)'
concept "Equipment requirement (finding)": {"Equipment requirement (finding) code"} display 'Equipment requirement (finding)'
concept "Equipment in use (finding)": {"Equipment in use (finding) code"} display 'Equipment in use (finding)'
concept "Durable medical equipment education, guidance, and counseling (procedure)": {"Durable medical equipment education, guidance, and counseling (procedure) code"} display 'Durable medical equipment education, guidance, and counseling (procedure)'
concept "Past history of procedure (situation)": {"Past history of procedure (situation) code"} display 'Past history of procedure (situation)'
concept "Evaluating interventions (procedure)": {"Evaluating interventions (procedure) code"} display 'Evaluating interventions (procedure)'
concept "Functional movement disorder (disorder)": {"Functional movement disorder (disorder) code"} display 'Functional movement disorder (disorder)'
concept "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": {"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code"}display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
concept "Secondary diagnosis": {"Secondary diagnosis code"} display 'Secondary diagnosis'
concept "Primary diagnosis": {"Primary diagnosis code"} display 'Primary diagnosis'
concept "Procedure aiding diagnosis (procedure)": {"Procedure aiding diagnosis (procedure) code"} display 'Procedure aiding diagnosis (procedure)'
concept "Blood gas analysis (procedure)": {"Blood gas analysis (procedure) code"} display 'Blood gas analysis (procedure)'
concept "Encounter Face to Face": {"Encounter Face to Face code"} display 'Encounter Face to Face'
concept "Seen by physician (finding)": {"Seen by physician (finding) code"} display 'Seen by physician (finding)'
concept "Seen by clinical nurse specialist (finding)": {"Seen by clinical nurse specialist (finding) code"} display 'Seen by clinical nurse specialist (finding)'
concept "Seen by nurse practitioner (finding)": {"Seen by nurse practitioner (finding) code"} display 'Seen by nurse practitioner (finding)'
concept "Referred by physician assistant (finding)": {"Referred by physician assistant (finding) code"} display 'Referred by physician assistant (finding)'
concept "Home oxygen therapy (procedure)": {"Home oxygen therapy (procedure) code"} display 'Home oxygen therapy (procedure)'
concept "Encounter Inpatient": {"Encounter Inpatient code"} display 'Encounter Inpatient'
concept "Encounter Hospital Outpatient": {"Encounter Hospital Outpatient code"} display 'Encounter Hospital Outpatient'
concept "initial": {"initial code"} display 'initial'
concept "title": {"title code"} display 'title'
concept "Checking patient identity (procedure)": {"Checking patient identity (procedure) code"} display 'Checking patient identity (procedure)'
concept "Confirming patient identity prior to procedure (procedure)": {"Confirming patient identity prior to procedure (procedure) code"} display 'Confirming patient identity prior to procedure (procedure)'
concept "Attending physician (occupation)": {"Attending physician (occupation) code"} display 'Attending physician (occupation)'
concept "National provider ID": {"National provider ID code"} display 'National provider ID'
concept "Illness (finding)": {"Illness (finding) code"} display 'Illness (finding)'
concept "Patient's condition worsened (finding)": {"Patient's condition worsened (finding) code"} display 'Patient\'s condition worsened (finding)'
concept "Patient's condition improved (finding)": {"Patient's condition improved (finding) code"} display 'Patient\'s condition improved (finding)'
concept "Conditional prognosis (finding)": {"Conditional prognosis (finding) code"} display 'Conditional prognosis (finding)'
concept "Mobile in home (finding)": {"Mobile in home (finding) code"} display 'Mobile in home (finding)'
concept "Gathering of past medical history (procedure)": {"Gathering of past medical history (procedure) code"} display 'Gathering of past medical history (procedure)'
concept "Therapeutic regimen (regime/therapy)": {"Therapeutic regimen (regime/therapy) code"} display 'Therapeutic regimen (regime/therapy)'
concept "Administration of prescribed medications based on arterial blood gas results (procedure)": {"Administration of prescribed medications based on arterial blood gas results (procedure) code"} display 'Administration of prescribed medications based on arterial blood gas results (procedure)'

context Patient

define "Physician":
	[Practitioner: "Attending physician (occupation)"] P
	where P.identifier.id = "National provider ID"
	return P.qualification.code

define "Practitioner Signature":
	'e-prescription containing digital Signature of the Pratitioner and date'

define "WOPD Details Required":
	{"Patient":"Patient",
	"Practitioner":"Physician",
	"DeviceRequest":"Equipment requirement (finding)",
	"DeviceUseStatement":"Equipment in use (finding)",
	"Observation": "Equipment related features (finding)",
	"Procedure": "Home oxygen therapy (procedure)",
	"Organization":"National provider ID",
	"Procedure": "Durable medical equipment education, guidance, and counseling (procedure)",
	"Encounter": "Encounter Face to Face",
	"Encounter": "Seen by physician (finding)",
	"Encounter": "Seen by clinical nurse specialist (finding)",
	"Encounter": "Seen by nurse practitioner (finding)",
	"Encounter": "Referred by physician assistant (finding)",
	"DiagnosticReport":"Primary diagnosis",
	"Condition":"Illness (finding)",
	"Observation": "Patient's condition worsened (finding)",
	"Observation": "Patient's condition improved (finding)",
	"Observation": "Mobile in home (finding)",
	"ClinicalImpression":"Conditional prognosis (finding)",
	"Procedure": "Blood gas analysis (procedure)",
	"MedicationAdministration":"Administration of prescribed medications based on arterial blood gas results (procedure)",
	"Condition": "Functional movement disorder (disorder)",
	"Procedure": "Evaluating interventions (procedure)",
	"Observation": "Past history of procedure (situation)",
	"Procedure": "Gathering of past medical history (procedure)"
	}

define "Requirements":
	"WOPD Details Required"
	union "Practitioner Signature"