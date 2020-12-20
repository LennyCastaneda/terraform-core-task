##################################################################################
#  VARIABLES
##################################################################################

variable "region" {
	type				= string
	default     = "us-west-2"
	description = "AWS region."
}

variable "environment" {
	type				= string
	default     = "nonprod-dev"
	description = "environment name"
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

module "redis_cluster" {
	source 			                  = "./modules/services/eliasticache/redis"
	environment	                  = var.environment
}
