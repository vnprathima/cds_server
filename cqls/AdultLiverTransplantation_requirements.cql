//Adult Liver Transplantation
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
codesystem "ICD10CM": 'https://www.cdc.gov/nchs/icd/icd10cm.htm'
codesystem "ICD10PCS": 'https://www.cdc.gov/nchs/icd/icd10cm_pcs.htm'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'
codesystem "NUCCPT": 'https://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/NUCCPT/sourcerepresentation.html'


//valueset "Encounter for aftercare following liver transplant":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Other long term (current) drug therapy": '2.16.840.1.113762.1.4.1096.101'
//valueset "Hepatic failure, unspecified without coma":'2.16.840.1.113883.3.88.12.3221.7.4'

//code "Encounter for dental examination and cleaning without abnormal findings code": '401191002' from "SNOMEDCT" display 'Encounter for dental examination and cleaning without abnormal findings'
code "Hepatic failure, unspecified without coma code": 'K72.90' from "ICD10CM" display 'Hepatic failure, unspecified without coma'
//code "Chronic pain due to malignancy (finding) code": '10181000119102'  from "SNOMEDCT" display 'Chronic pain due to malignancy (finding)'
code "Transplantation of Liver, Allogeneic, Open Approach code": '0FY00Z0' from "ICD10PCS" display 'Transplantation of Liver, Allogeneic, Open Approach'
code "Transplantation of Liver, Syngeneic, Open Approach code": '0FY00Z1' from "ICD10PCS" display 'Transplantation of Liver, Syngeneic, Open Approach'
code "Transplantation of Liver, Zooplastic, Open Approach code": '0FY00Z2' from "ICD10PCS" display 'Transplantation of liver (procedure)'
//code "Secondary neuroendocrine tumor of liver code": '209.72' from "ICD9CM" display 'Secondary neuroendocrine tumor of liver'
//code "Metastasis from malignant tumor of liver (disorder) code": '315000005' from "SNOMEDCT" display 'Metastasis from malignant tumor of liver (disorder)'
//code "Carcinoma in situ of extrahepatic bile ducts (disorder) code": '92589000' from "SNOMEDCT" display 'Carcinoma in situ of extrahepatic bile ducts (disorder)'
//code "Cholangiocarcinoma of biliary tract (disorder) code": '312104005' from "SNOMEDCT" display 'Cholangiocarcinoma of biliary tract (disorder)'
//code "Tumor surgically unresectable (finding) code": '711361003' from "SNOMEDCT" display 'Tumor surgically unresectable (finding)'
//code "Hemangioendothelioma of liver (disorder) code": '427744002' from "SNOMEDCT" display 'Hemangioendothelioma of liver (disorder)'
code "Encounter for aftercare following liver transplant code": 'Z48.23' from "ICD10CM" display 'Encounter for aftercare following liver transplant'
code "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code": '261QF0400X' from "NUCCPT" display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
code "Other long term (current) drug therapy code": 'Z79.899' from "ICD10CM" display 'Other long term (current) drug therapy'
/*code "Colonoscopy, flexible; with biopsy, single or multiple code": '45380' from "CPT" display 'Colonoscopy, flexible; with biopsy, single or multiple'
code "Sigmoidoscopy, flexible; diagnostic, including collection of specimen(s) by brushing or washing, when performed (separate procedure) code": '45330' from "CPT" display 'Sigmoidoscopy, flexible; diagnostic, including collection of specimen(s) by brushing or washing, when performed (separate procedure)'
code "General categories [Interpretation] of Cervical or vaginal smear or scraping by Cyto stain code": '19762-4' from "LOINC" display 'General categories [Interpretation] of Cervical or vaginal smear or scraping by Cyto stain'
code "MG Breast Screening code": '24606-6' from "LOINC" display 'MG Breast Screening'*/
code "General health panel This panel must include the following: Comprehensive metabolic panel (80053) Blood count, complete (CBC), automated and automated differential WBC count (85025 or 85027 and 85004) OR Blood count, complete (CBC), automated (85027) and appropriate manual differential WBC count (85007 or 85009) Thyroid stimulating hormone (TSH) (84443) code": '80050' from "CPT" display 'General health panel This panel must include the following: Comprehensive metabolic panel (80053) Blood count, complete (CBC), automated and automated differential WBC count (85025 or 85027 and 85004) OR Blood count, complete (CBC), automated (85027) and appropriate manual differential WBC count (85007 or 85009) Thyroid stimulating hormone (TSH) (84443)'
code "Encounter for screening for human immunodeficiency virus [HIV] code": 'Z11.4' from "ICD10CM" display 'Encounter for screening for human immunodeficiency virus [HIV]'
code "Encounter for screening for other viral diseases code": 'Z11.59' from "ICD10CM" display 'Encounter for screening for other viral diseases'
code "Abnormal immunological finding in serum, unspecified code": 'R76.9' from "ICD10CM" display 'Abnormal immunological finding in serum, unspecified'
code "Low dose CT scan (LDCT) for lung cancer screening code" : 'G0297' from "CPT" display 'Low dose CT scan (LDCT) for lung cancer screening'
code "Pulmonary Function Testing—no bronchodilator code" : '94010' from "CPT" display 'Pulmonary Function Testing—no bronchodilator'
code "Radiologic examination, chest; single view code" : '71045' from "CPT" display 'Radiologic examination, chest; single view'

code "Echocardiography, transthoracic, real-time with image documentation (2D), includes M-mode recording, when performed, during rest and cardiovascular stress test using treadmill, bicycle exercise and/or pharmacologically induced stress, with interpretation and report code" : '93350' from "CPT"
 display 'Echocardiography, transthoracic, real-time with image documentation (2D), includes M-mode recording, when performed, during rest and cardiovascular stress test using treadmill, bicycle exercise and/or pharmacologically induced stress, with interpretation and report'
code "Cardiac blood pool imaging gated equilibrium code" : '78472' from "CPT" display 'Cardiac blood pool imaging gated equilibrium'
code "Electrocardiogram, routine ECG with at least 12 leads; interpretation and report only code" :'93010' from "CPT" display 'Electrocardiogram, routine ECG with at least 12 leads; interpretation and report only'



concept "Echocardiography, transthoracic, real-time with image documentation (2D), includes M-mode recording, when performed, during rest and cardiovascular stress test using treadmill, bicycle exercise and/or pharmacologically induced stress, with interpretation and report" :
{"Echocardiography, transthoracic, real-time with image documentation (2D), includes M-mode recording, when performed, during rest and cardiovascular stress test using treadmill, bicycle exercise and/or pharmacologically induced stress, with interpretation and report code"} display
'Echocardiography, transthoracic, real-time with image documentation (2D), includes M-mode recording, when performed, during rest and cardiovascular stress test using treadmill, bicycle exercise and/or pharmacologically induced stress, with interpretation and report'
concept "Cardiac blood pool imaging gated equilibrium" :{"Cardiac blood pool imaging gated equilibrium code"} display 'Cardiac blood pool imaging gated equilibrium'
concept "Electrocardiogram, routine ECG with at least 12 leads; interpretation and report only" : {"Electrocardiogram, routine ECG with at least 12 leads; interpretation and report only code"} display 'Electrocardiogram, routine ECG with at least 12 leads; interpretation and report only'

concept "Low dose CT scan (LDCT) for lung cancer screening" : {"Low dose CT scan (LDCT) for lung cancer screening code"} display 'Low dose CT scan (LDCT) for lung cancer screening'
concept "Pulmonary Function Testing—no bronchodilator" : {"Pulmonary Function Testing—no bronchodilator code"} display 'Pulmonary Function Testing—no bronchodilator'
concept "Radiologic examination, chest; single view" :{"Radiologic examination, chest; single view code"} display 'Radiologic examination, chest; single view'
concept "Abnormal immunological finding in serum, unspecified": {"Abnormal immunological finding in serum, unspecified code"} display 'Abnormal immunological finding in serum, unspecified'
concept "Encounter for screening for other viral diseases": {"Encounter for screening for other viral diseases code"} display 'Encounter for screening for other viral diseases'
concept "Encounter for screening for human immunodeficiency virus [HIV]": {"Encounter for screening for human immunodeficiency virus [HIV] code"} display 'Encounter for screening for human immunodeficiency virus [HIV]'
concept "General health panel This panel must include the following: Comprehensive metabolic panel (80053) Blood count, complete (CBC), automated and automated differential WBC count (85025 or 85027 and 85004) OR Blood count, complete (CBC), automated (85027) and appropriate manual differential WBC count (85007 or 85009) Thyroid stimulating hormone (TSH) (84443)": {"General health panel This panel must include the following: Comprehensive metabolic panel (80053) Blood count, complete (CBC), automated and automated differential WBC count (85025 or 85027 and 85004) OR Blood count, complete (CBC), automated (85027) and appropriate manual differential WBC count (85007 or 85009) Thyroid stimulating hormone (TSH) (84443) code"} display 'General health panel This panel must include the following: Comprehensive metabolic panel (80053) Blood count, complete (CBC), automated and automated differential WBC count (85025 or 85027 and 85004) OR Blood count, complete (CBC), automated (85027) and appropriate manual differential WBC count (85007 or 85009) Thyroid stimulating hormone (TSH) (84443)'
/*concept "Colonoscopy, flexible; with biopsy, single or multiple": {"Colonoscopy, flexible; with biopsy, single or multiple code"} display 'Colonoscopy, flexible; with biopsy, single or multiple'
concept "Sigmoidoscopy, flexible; diagnostic, including collection of specimen(s) by brushing or washing, when performed (separate procedure) code": {"Sigmoidoscopy, flexible; diagnostic, including collection of specimen(s) by brushing or washing, when performed (separate procedure) code"} display 'Sigmoidoscopy, flexible; diagnostic, including collection of specimen(s) by brushing or washing, when performed (separate procedure)'
concept "General categories [Interpretation] of Cervical or vaginal smear or scraping by Cyto stain": {"General categories [Interpretation] of Cervical or vaginal smear or scraping by Cyto stain code"} display 'General categories [Interpretation] of Cervical or vaginal smear or scraping by Cyto stain code'
concept "MG Breast Screening": {"MG Breast Screening code"} display 'MG Breast Screening'*/
concept "Other long term (current) drug therapy": {"Other long term (current) drug therapy code"} display 'Other long term (current) drug therapy'
concept "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": {"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code"}display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
//concept "Encounter for dental examination and cleaning without abnormal findings": {"Encounter for dental examination and cleaning without abnormal findings code"} display 'Encounter for dental examination and cleaning without abnormal findings'
concept "Hepatic failure, unspecified without coma": {"Hepatic failure, unspecified without coma code"} display 'Hepatic failure, unspecified without coma'
//concept "Chronic pain due to malignancy (finding)": {"Chronic pain due to malignancy (finding) code"} display 'Chronic pain due to malignancy (finding)'
concept "Transplantation of Liver, Allogeneic, Open Approach": {"Transplantation of Liver, Allogeneic, Open Approach code"} display 'Transplantation of Liver, Allogeneic, Open Approach'
concept "Transplantation of Liver, Syngeneic, Open Approach": {"Transplantation of Liver, Syngeneic, Open Approach code"} display 'Transplantation of Liver, Syngeneic, Open Approach'
concept "Transplantation of Liver, Zooplastic, Open Approach": {"Transplantation of Liver, Zooplastic, Open Approach code"} display 'Transplantation of Liver, Zooplastic, Open Approach'
//concept "Secondary neuroendocrine tumor of liver": {"Secondary neuroendocrine tumor of liver code"} display 'Secondary neuroendocrine tumor of liver'
//concept "Metastasis from malignant tumor of liver (disorder)": {"Metastasis from malignant tumor of liver (disorder) code"} display 'Metastasis from malignant tumor of liver (disorder)'
//concept "Carcinoma in situ of extrahepatic bile ducts (disorder)": {"Carcinoma in situ of extrahepatic bile ducts (disorder) code"} display 'Carcinoma in situ of extrahepatic bile ducts (disorder)'
//concept "Cholangiocarcinoma of biliary tract (disorder)": {"Cholangiocarcinoma of biliary tract (disorder) code"} display 'Cholangiocarcinoma of biliary tract (disorder)'
//concept "Tumor surgically unresectable (finding)": {"Tumor surgically unresectable (finding) code"}display 'Tumor surgically unresectable (finding)'
//concept "Hemangioendothelioma of liver (disorder)": {"Hemangioendothelioma of liver (disorder) code"} display 'Hemangioendothelioma of liver (disorder)'
concept "Encounter for aftercare following liver transplant": {"Encounter for aftercare following liver transplant code"} display 'Encounter for aftercare following liver transplant'

context Patient

define "Procedure1":
    {"Procedure":{
    		"code":"Transplantation of Liver, Allogeneic, Open Approach"
    		}
    }

define "Procedure2":
	{"Procedure":{
   		"code":"Transplantation of Liver, Syngeneic, Open Approach"
   		}
   	}

define "Procedure3":
	{"Procedure":{
    		"code":"Transplantation of Liver, Zooplastic, Open Approach"
    		}
    	}

define "Condition1":
	{"Condition":{
			"code":"Hepatic failure, unspecified without coma"
		     }
	}

define "Condition2":
	{"Location":{
			"mode":"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)"
		     }
	}

define "Condition3":
	{"EpisodeOfCare":{
			"diagnosis":{
                "condition":"Encounter for aftercare following liver transplant"
                }
		     }
	}

define "Condition4":
	{"MedicationStatement":{
			"basedOn":"Other long term (current) drug therapy"
		     }
	}


define "ClinicalEvaluation":
	 {"ClinicalImpression":{
	 			"problem":'Identification of comorbidities',
	 			"previous":'Treatment of co-morbidities',
	 			"encounter":'Current assessment of co-morbidities',
	 			"note":'Consult notes (if applicable)'
	 			}
	 }

define "Psycho-SocialEvaluation":
    {"Condition":{
    		"clinicalStatus":'Karnofsky performance score',
    		"code":'Identification of stressors'
    		}
    }

define "LabTest1":
    {"DiagnosticReport":{
    			"code":"General health panel This panel must include the following: Comprehensive metabolic panel (80053) Blood count, complete (CBC), automated and automated differential WBC count (85025 or 85027 and 85004) OR Blood count, complete (CBC), automated (85027) and appropriate manual differential WBC count (85007 or 85009) Thyroid stimulating hormone (TSH) (84443)"
    			}
    }

define "LabTest2":
    {"DiagnosticReport":{
    			"code":"Abnormal immunological finding in serum, unspecified"
    			}
    }

define "LabTest3":
    {"DiagnosticReport":{
    			"code":"Encounter for screening for other viral diseases"
    			}
    }

define "LabTest4":
    {"DiagnosticReport":{
    			"code":"Encounter for screening for human immunodeficiency virus [HIV]"
    			}
    }


define "CardiacAssessment1":
    {"DiagnosticReport":{
    			"code":"Electrocardiogram, routine ECG with at least 12 leads; interpretation and report only"
    			}
    }

define "CardiacAssessment2":
    {"DiagnosticReport":{
    			"code":"Echocardiography, transthoracic, real-time with image documentation (2D), includes M-mode recording, when performed, during rest and cardiovascular stress test using treadmill, bicycle exercise and/or pharmacologically induced stress, with interpretation and report"
    			}
    }

define "CardiacAssessment3":
    {"DiagnosticReport":{
    			"code":"Cardiac blood pool imaging gated equilibrium"
    			}
    }


define "PulmonaryAssessment1":
    {"DiagnosticReport":{
    			"code":"Low dose CT scan (LDCT) for lung cancer screening"
    			}
    }

define "PulmonaryAssessment2":
    {"DiagnosticReport":{
    			"code":"Pulmonary Function Testing—no bronchodilator"
    			}
    }

define "PulmonaryAssessment3":
    {"DiagnosticReport":{
    			"code":"Radiologic examination, chest; single view"
    			}
    }


define "Seven Element Order":
    {"Claim":{"patient":{
            "name":Patient.name
            },
        "provider":{
            "name":'Physician or Practitioner Name'
            },
        "item":{
            "detail":'Description of the item ordered',
                "encounter":{
                    "period":{
                        "end":'Date of the face-to-face examination'
                    }
                }
            },
        "diagnosis":{
            "diagnosis":{
                "diagnosisReference":'Pertinent diagnoses/conditions that relate to the need for the item ordered'
                }
            },
        "prescription":{
            " occurrence":{
                "occurrencePeriod":'Length of need'
                }
            }
        },
    //Signature has to be linked to the Physician attribute in Claim
    "Signature":{
        "who":'Physician signature',
        "when":'Date of physician signature'
        }
    }
define "PriorAuthorization":
	false
	
define "Requirements":
	{"Codes":
		{
			"Procedures":{
                "Procedure1",{'or'},
                "Procedure2",{'or'},
                "Procedure3",{'or'}
				},
		 	"Conditions":{
		 	    "Condition1",{'and'},
                "Condition2",{'and'},
                "Condition3",{'and'},
                "Condition4"
		 	    },
		 	"LabTests":{
		 	    "LabTest1",{'and'},
                "LabTest2",{'and'},
                "LabTest3",{'and'},
                "LabTest4"
		 	    },
    		"CardiacAssessment":{
    		    "CardiacAssessment1",{'and'},
                "CardiacAssessment2",{'and'},
                "CardiacAssessment3"
    		    },
    		"PulmonaryAssessment":{
    		      "PulmonaryAssessment1",{'and'},
                  "PulmonaryAssessment2",{'and'},
                  "PulmonaryAssessment3"
		 },
	 "DocumentsFromFHIR":
		 {
     		"ClinicalEvaluation":{
     		    "ClinicalImpression":{
                    "problem":'Identification of comorbidities',
                    "previous":'Treatment of co-morbidities',
                    "encounter":'Current assessment of co-morbidities',
                    "note":'Consult notes (if applicable)'
	 			}
     		},
     		"Psycho-SocialEvaluation":{
     		    "Condition":{
                    "clinicalStatus":'Karnofsky performance score',
                    "code":'Identification of stressors'
                    }
            }
         }
	
	 }
	 }