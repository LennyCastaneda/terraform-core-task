##################################################################################
#  VARIABLES
##################################################################################

variable "region" {
	type				= string
	default     = "us-west-2"
	description = "AWS region."
}

variable "vpc_id" {
	type				= string
	description = "VPC ID"
}

variable "ami_id" {
	type				= string
	description = "VPC ID"
}

variable "instance_type" {
	type				= string
  default     = "t3.medium"
	description = "VPC ID"
}

variable "subnet_id" {
	type				= string
	description = "VPC ID"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-west-1a", "us-west-1b", "us-west-1c"]
}

variable "vpc_security_group_ids" {
	type				= string
	description = "VPC ID"
}

variable "name" {
	type				= string
  default     = "Application Server"
	description = "Name of resource"
}

variable "environment" {
	type				= string
	default     = "nonprod-dev"
	description = "environment name"
}

variable "owner" {
	type				= string
	default     = "SRE Team"
}

variable "count" {
	type				= string
	default     = 3
  description = "Application server count"
}

##################################################################################
#  VERSION
##################################################################################

module "terraform_version" {
	source  = "./modules/version"
	region 	= var.region
}

##################################################################################
# PROVIDER
##################################################################################

provider "aws" {
	region  = var.region
}

##################################################################################
# RESOURCES
##################################################################################

module "worker_servers" {
	source 			            = "./modules/services/ec2"
  count                   = var.count
	environment	            = var.environment
  ami                     = var.ami_id
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  availability_zone       = var.availability_zone
  vpc_security_group_ids  = var.vpc_security_group_ids
}
