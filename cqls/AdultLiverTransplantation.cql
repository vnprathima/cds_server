library AdultLiverTransplantation version '1'
using FHIR version '1.0.2'

codesystem "SNOMEDCT": 'http://snomed.info/sct'
code "End Stage Liver Disease (disorder) code": '708248004' from "SNOMEDCT" display 'End Stage Liver Disease (disorder)'
concept "End Stage Liver Disease (disorder)": { "End Stage Liver Disease (disorder) code" } display 'End Stage Liver Disease (disorder)'

context Patient

define "Livertransplant":
	exists(
		[Condition: "End Stage Liver Disease (disorder)"] C
		where C.verificationStatus.value = 'confirmed'
	)
		
define "Covered":
	"Livertransplant"
		
define "Coverage":
	"Covered"
