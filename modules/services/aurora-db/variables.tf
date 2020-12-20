##################################################################################
#  VARIABLES
##################################################################################

variable "environment" {
	type				= string
	description = "environment name"
}

variable "username" {
	type				= string
	description = "Aurora DB username"
}

variable "password" {
	type				= string
	description = "Aurora DB password"
}