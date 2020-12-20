##################################################################################
# VARIABLES
##################################################################################

variable "vpc_id" {
    type        = string
	description = "The ID for VPC of a given AWS account."
}

variable "environment" {
    type        = string
	description = "Deployment Environment."
}