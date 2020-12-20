##################################################################################
#  LOCALS
##################################################################################

locals {
	common_tags = "${map(
		"ApplicationName", "BackendBucket",
		"CostCenter", "Infrastructure",
		"Classification", "Confidential",
		"Terraform", "true"
	)}"
}