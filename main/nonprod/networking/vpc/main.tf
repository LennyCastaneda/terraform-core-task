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
	default     = "us-west-2"
	description = "Nonprod VPC ID"
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

module "nonprod_vpc" {
	source 			= "./modules/networking/vpc/nonprod"
	environemnt	= "nonprod" 
}

module "nonprod_vpc_security_groups" {
    source 	= "./modules/networking/security-groups/nonprod"
		vpc_id	= module.vpc_id
}


##################################################################################
#  BACKEND
##################################################################################

// terraform {
// 	backend "s3" {
// 		bucket          = "tf-core-remote-state-nonprod
// 		key             = "networking/nonprod-vpc/terraform.state"
// 		region          = "us-west-2"
// 		encrypt         = true
// 		dynamodb_table  = "terraform-tfstatelock"
// 	}
// }

##################################################################################
#  OUTPUTS
##################################################################################

output "vpc_id" {
	value   	= module.vpc.id
	description	= "VPC ID"
}