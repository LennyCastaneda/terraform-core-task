##################################################################################
#  VARIABLES
##################################################################################

variable "region" {
	type				= string
	default     = "us-west-2"
	description = "AWS region."
}

variable "aws_account" {
	type				= string
	description = "AWs account name"
}

variable "aws_account_id" {
	type				= string
	description = "AWS Account ID"
}

variable "vpc_id" {
	type				= string
	description = "VPC ID"
}

variable "owner" {
	type				= string
	description = "Owner of project"
}

variable "environment" {
	type				= string
	description = "Deployment environment"
}

variable "count" {
	type				= string
	default     = 3
  description = "Worker server count"
}