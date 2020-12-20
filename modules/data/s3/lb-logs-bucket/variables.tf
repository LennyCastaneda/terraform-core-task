##################################################################################
# S3 BUCKET VARIABLES
##################################################################################

variable "aws_account" {
    type        = string
	default		= ""
    description = "AWS Account: Dev, QA or empty string, which is PROD."
}

variable "aws_account_id" {
    type        = string
    description = "AWS account that owns the load balancer."
}

variable "target_bucket" {
    type        = string
	description = "Name of load balancer log target bucket."
}

variable "target_prefix" {
	type		= string
	description	= "Prefix for target S3 bucket containing load balancer logs."
}

variable "force_destroy" {
	type		= string
	default		= false
	description	= "Allows all objects to be deleted from the bucket so it can be destroyed without error. These objects are not recoverable.."
}

variable "owner" {
	type		= string
	description = "Owner of the AWS resource."
}

variable "environment" {
	type		= string
	description = "Name of environment the resources lives in."
}