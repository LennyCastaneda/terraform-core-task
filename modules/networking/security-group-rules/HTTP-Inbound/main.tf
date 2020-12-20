##################################################################################
# VARIABLES
##################################################################################

variable "security_group_id" {
    type        = string
    description = "The security group to apply this rule to."
}

##################################################################################
# SECURITY GROUP RULE
##################################################################################

# INBOUND
resource "aws_security_group_rule" "http_cisco_vpn" {
    type                        = "ingress"
    from_port                   = 80
    to_port                     = 80
    protocol                    = "tcp" 
    cidr_blocks                 = [ "0.0.0.0/0"]
    security_group_id           = var.security_group_id
    description                 = "HTTP from anywhere"
}

