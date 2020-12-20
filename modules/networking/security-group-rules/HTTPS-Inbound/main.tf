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
resource "aws_security_group_rule" "https_cisco_vpn" {
    type                        = "ingress"
    from_port                   = 443
    to_port                     = 443
    protocol                    = "tcp" 
    cidr_blocks                 = [ "0.0.0.0/0" ]
    security_group_id           = var.security_group_id
    description                 = "SSL from anywhere"
}

