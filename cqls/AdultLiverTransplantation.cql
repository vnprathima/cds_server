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

valueset "Transplantation of liver (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Metastasis from malignant tumor of liver (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cholangiocarcinoma of biliary tract (disorder)":'2.16.840.1.113883.3.526.3.1010'
valueset "Secondary neuroendocrine tumor of liver":'2.16.840.1.113883.3.526.3.1010'
valueset "Carcinoma in situ of extrahepatic bile ducts (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tumor surgically unresectable (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemangioendothelioma of liver (disorder)":'2.16.840.1.113762.1.4.1029.63'
valueset "Acute Hepatitis B Virus Infection (Disorders) (ICD10CM)": '2.16.840.1.113762.1.4.1146.131'
valueset "Instructions for Follow Up After Discharge":'2.16.840.1.113883.3.117.1.7.1.378'
valueset "Immunosuppressive therapy for transplant (procedure)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Postoperative follow-up visit (procedure)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Aftercare for liver transplant done (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Immunosuppressive Drugs for Urology Care":'2.16.840.1.113762.1.4.1151.32'
valueset "Sandimmune Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "Imuran Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "ATGAM Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "Muromonab-CD3 Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "Prograf Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "mycophenolate mofetil Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "Daclizumab Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "Cyclophosphamide Drug":'2.16.840.1.113762.1.4.1010.7'
valueset "Prednisone Drug":'2.16.840.1.113762.1.4.1010.7'
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
code "Sandimmune code":'202816' from "RXNORM" display 'Sandimmune'
code "Imuran code":'202559' from "RXNORM" display 'Imuran'
code "ATGAM code":'1204' from "RXNORM" display 'ATGAM'
code "Muromonab-CD3 code":'42405' from "RXNORM" display 'Muromonab-CD3'
code "Prograf code":'196463' from "RXNORM" display 'Prograf'
code "mycophenolate mofetil code":'68149' from "RXNORM" display 'mycophenolate mofetil'
code "Daclizumab code":'190353' from "RXNORM" display 'Daclizumab'
code "Cyclophosphamide code":'3002' from "RXNORM" display 'Cyclophosphamide'
code "Prednisone code":'8640' from "RXNORM" display 'Prednisone'
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
concept "Sandimmune": {"Sandimmune code"} display 'Sandimmune'
concept "Imuran": "Imuran code"display 'Imuran'
concept "ATGAM": {"ATGAM code"} display 'ATGAM'
concept "Muromonab-CD3": {"Muromonab-CD3"}display 'Muromonab-CD3'
concept "Prograf": {"Prograf code"} display 'Prograf'
concept "mycophenolate mofetil": {"mycophenolate mofetil code"} display 'mycophenolate mofetil'
concept "Daclizumab":{"Daclizumab code"} display 'Daclizumab'
concept "Cyclophosphamide":"Cyclophosphamide code"display 'Cyclophosphamide'
concept "Prednisone":"Prednisone code" display 'Prednisone'


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

	
define "Coverage":
	"Covered"