##################################################################################
# VARIABLES
##################################################################################

variable "aws_account" {
    type        = string
		default		= ""
    description = "AWS Account environment"
}

variable "s3_bucket" {
	type		= string
	description = "Name of the S3 bucket."
}

variable "bucket_policy" {
	type		= string
	description = "Bucket policy."
}

variable "owner" {
	type		= string
	description = "Owner of the AWS resource."
}

variable "environment" {
	type		= string
	description = "Name of environment resource lives on."
}