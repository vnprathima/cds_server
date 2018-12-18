library AdultLiverTransplantation version '1'

using FHIR version '1.8'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "NUCCPT": ''

//valueset "Aftercare for liver transplant done (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Prescription medication started (situation)": '2.16.840.1.113762.1.4.1096.101'
//valueset "End Stage Liver Disease":'2.16.840.1.113883.3.88.12.3221.7.4'

code "End Stage Liver Disease code": '708248004' from "SNOMEDCT" display 'End Stage Liver Disease'
code "Follow-up arranged (finding) code": '183616001' from "SNOMEDCT" display 'Follow-up arranged'
code "Immunosuppressive therapy for transplant (procedure) code": '7447008' from "SNOMEDCT" display 'Immunosuppressive therapy for transplant'
code "Postoperative follow-up visit (procedure) code": '439740005' from "SNOMEDCT" display 'Postoperative follow-up visit'
code "Prescription medication started (situation) code": '432861000124103' from "SNOMEDCT" display 'Prescription medication started'
code "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code": '261QF0400X' from "NUCCPT" display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
code "Transplantation of liver (procedure) code": '18027006' from "SNOMEDCT" display 'Transplantation of liver (procedure)'
code "Aftercare for liver transplant done (situation) code": '96601000119101' from "SNOMEDCT" display 'Aftercare for liver transplant done'
code "Prescription (procedure) code": '16076005' from "SNOMEDCT" display 'Prescription'

concept "End Stage Liver Disease": {"End Stage Liver Disease code"}display 'End Stage Liver Disease'
concept "Transplantation of liver (procedure)": {"Transplantation of liver (procedure) code"} display 'Transplantation of liver (procedure)'
concept "Follow-up arranged": {"Follow-up arranged (finding) code"}display 'Follow-up arranged'
concept "Immunosuppressive therapy for transplant": {"Immunosuppressive therapy for transplant (procedure) code"}display 'Immunosuppressive therapy for transplant'
concept "Postoperative follow-up visit": {"Postoperative follow-up visit (procedure) code"} display 'Postoperative follow-up visit'
concept "Prescription medication started": {"Prescription medication started (situation) code"} display 'Prescription medication started'
concept "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": {"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code"}display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
concept "Aftercare for liver transplant done": {"Aftercare for liver transplant done (situation) code"}display 'Aftercare for liver transplant done'
concept "Prescription": {"Prescription (procedure) code"}display 'Prescription'

context Patient

define "Documents":
	{"Condition": "End Stage Liver Disease", "Procedure": "Transplantation of liver (procedure)", "Location":"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)","EpisodeOfCare": "Aftercare for liver transplant done", "MedicationStatement": "Prescription"}
	
define "AttachableDocuments":
	'Seven Element Order'
	
define "Requirements":
	"Documents" union "AttachableDocuments"