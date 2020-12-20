##################################################################################
#  LOCALS
##################################################################################

locals {
	common_tags = "${map(
		"ApplicationName", "LoadBalancerLogs",
		"CostCenter", "Infrastructure",
		"Classification", "Confidential",
		"Terraform", "true"
	)}"
}