##################################################################################
#  LOCALS
##################################################################################

locals {
	common_tags = "${map(
		"ApplicationName", "ApplicationServer",
		"CostCenter", "Infrastructure",
		"DataClassification", "OpenSource",
		"Terraform", "true"
	)}"
}