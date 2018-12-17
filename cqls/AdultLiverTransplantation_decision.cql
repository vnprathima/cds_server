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
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'


valueset "Sandimmune":'2.16.840.1.113762.1.4.1010.7'
valueset "Imuran":'2.16.840.1.113762.1.4.1010.7'
valueset "ATGAM":'2.16.840.1.113762.1.4.1010.7'
valueset "Muromonab-CD3":'2.16.840.1.113762.1.4.1010.7'
valueset "Prograf":'2.16.840.1.113762.1.4.1010.7'
valueset "mycophenolate mofetil":'2.16.840.1.113762.1.4.1010.7'
valueset "Daclizumab":'2.16.840.1.113762.1.4.1010.7'
valueset "Cyclophosphamide":'2.16.840.1.113762.1.4.1010.7'
valueset "Prednisone":'2.16.840.1.113762.1.4.1010.7'
code "Diabetic foot examination (regime/therapy) code": '401191002' from "SNOMEDCT" display 'Diabetic foot examination (regime/therapy)'
code "End Stage Liver Disease code": '708248004' from "SNOMEDCT" display 'End Stage Liver Disease'
code "Chronic pain due to malignancy (finding) code": '10181000119102'  from "SNOMEDCT" display 'Chronic pain due to malignancy (finding)'
code "Transplantation of liver (procedure) code": '18027006' from "SNOMEDCT" display 'Transplantation of liver (procedure)'
code "Secondary neuroendocrine tumor of liver code": '209.72' from "ICD9CM" display 'Secondary neuroendocrine tumor of liver'
code "Metastasis from malignant tumor of liver (disorder) code": '315000005' from "SNOMEDCT" display 'Metastasis from malignant tumor of liver (disorder)'
code "Carcinoma in situ of extrahepatic bile ducts (disorder) code": '92589000' from "SNOMEDCT" display 'Carcinoma in situ of extrahepatic bile ducts (disorder)'
code "Cholangiocarcinoma of biliary tract (disorder) code": '312104005' from "SNOMEDCT" display 'Cholangiocarcinoma of biliary tract (disorder)'
code "Tumor surgically unresectable (finding) code": '711361003' from "SNOMEDCT" display 'Tumor surgically unresectable (finding)'
code "Hemangioendothelioma of liver (disorder) code": '427744002' from "SNOMEDCT" display 'Hemangioendothelioma of liver (disorder)'
code "Aftercare for liver transplant done (situation) code": '96601000119101' from "SNOMEDCT" display 'Aftercare for liver transplant done (situation)'
concept "End Stage Liver Disease": {"End Stage Liver Disease code"} display 'End Stage Liver Disease'
concept "Chronic pain due to malignancy (finding)": {"Chronic pain due to malignancy (finding) code"} display 'Chronic pain due to malignancy (finding)'
concept "Transplantation of liver (procedure)": {"Transplantation of liver (procedure) code"} display 'Transplantation of liver (procedure)'
concept "Secondary neuroendocrine tumor of liver": {"Secondary neuroendocrine tumor of liver code"} display 'Secondary neuroendocrine tumor of liver'
concept "Metastasis from malignant tumor of liver (disorder)": {"Metastasis from malignant tumor of liver (disorder) code"} display 'Metastasis from malignant tumor of liver (disorder)'
concept "Carcinoma in situ of extrahepatic bile ducts (disorder)": {"Carcinoma in situ of extrahepatic bile ducts (disorder) code"} display 'Carcinoma in situ of extrahepatic bile ducts (disorder)'
concept "Cholangiocarcinoma of biliary tract (disorder)": {"Cholangiocarcinoma of biliary tract (disorder) code"} display 'Cholangiocarcinoma of biliary tract (disorder)'
concept "Tumor surgically unresectable (finding)": {"Tumor surgically unresectable (finding) code"}display 'Tumor surgically unresectable (finding)'
concept "Hemangioendothelioma of liver (disorder)": {"Hemangioendothelioma of liver (disorder) code"} display 'Hemangioendothelioma of liver (disorder)'
concept "Aftercare for liver transplant done (situation)": {"Aftercare for liver transplant done (situation) code"} display 'Aftercare for liver transplant done (situation)'



context Patient


define "Livertransplant":
	exists([Condition: "End Stage Liver Disease"])
	and exists([Procedure: "Transplantation of liver (procedure)"])
	and not exists([Condition: "Chronic pain due to malignancy (finding)"])
	
			
define "neuroendocrinetumor":
	exists([Condition:"End Stage Liver Disease"])
	and exists([Condition:"Secondary neuroendocrine tumor of liver"])
	and exists([Condition:"Metastasis from malignant tumor of liver (disorder)"])
	and exists([Procedure:"Transplantation of liver (procedure)"])

define "Cholangiocarcinoma":
	exists([Condition: "End Stage Liver Disease"])
	and exists([Condition: "Carcinoma in situ of extrahepatic bile ducts (disorder)"])
	and exists([Condition: "Cholangiocarcinoma of biliary tract (disorder)"])
	and exists([Condition: "Tumor surgically unresectable (finding)"])
	and exists([Procedure: "Transplantation of liver (procedure)"])
	
define "Hemangioendothelioma":
	exists([Condition: "Hemangioendothelioma of liver (disorder)"])

define "Malignancies":
	Cholangiocarcinoma
	or neuroendocrinetumor
	or Hemangioendothelioma
		
define "Covered":
	Livertransplant or Malignancies or Followup or ImmunosuppressiveDrugs
	
define "Followup":
	exists(
		[ClinicalImpression: "Aftercare for liver transplant done (situation)"]
	)
	
define "ImmunosuppressiveDrugs":
	exists([MedicationAdministration: "Sandimmune"])
	or exists([MedicationAdministration: "Imuran"])
	or exists([MedicationAdministration: "ATGAM"])
	or exists([MedicationAdministration: "Muromonab-CD3"])
	or exists([MedicationAdministration: "Prograf"])
	or exists([MedicationAdministration: "mycophenolate mofetil"])
	or exists([MedicationAdministration: "Daclizumab"])
	or exists([MedicationAdministration: "Cyclophosphamide"])
	or exists([MedicationAdministration: "Prednisone"])
	
define "Coverage":
	"Covered"