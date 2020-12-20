##################################################################################
#  VARIABLES
##################################################################################

variable "ami_id" {
    type        = string    
    description = "AWS AMI to launch an instance with."
}

variable "instance_type" {
    type        = string  
    default     = "t3.large"  
    description = "Instance type size."
}

variable "subnet_id" {
    type        = string    
    description = "The subnet ID the instnace will be launched in."
}

variable "availability_zone" {
    type        = string    
    description = "The Availability Zone the instance will reside in."
}

variable "vpc_security_group_ids" {
    type        = list(string)    
    description = "List of security group IDs to be applied to the instance."
}

variable "name" {
    type        = string
    description = "Name tag of the instance."
}

variable "owner" {
    type        = string   
    description = "Owner tag of the instance."
}

variable "environment" {
    type        = string   
    description = "Environment tag of the instance."
}