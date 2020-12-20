##################################################################################
#  VARIABLES
##################################################################################

variable "environemnt" {
    type        = string
	default		= ""
    description = "Deployment environment"
}


variable "vpc_id" {
	type		= string
	default     = "us-west-2"
	description = "VPC ID"
}