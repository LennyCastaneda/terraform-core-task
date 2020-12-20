##################################################################################
#  VERSION
##################################################################################

terraform {
	required_version = ">= 0.12.6"
}

##################################################################################
# PROVIDERS
##################################################################################

/* 
The AWS provider updates often & does a good job of maintaining backwards compatibility, 
so you typically want to pin to a specific major version, but allow new patch versions 
to be picked up automatically so you get easy access to new features.
*/

provider "aws" {
	# Allow any 2.x version of the AWS provider
	version = "~> 2.16"
}