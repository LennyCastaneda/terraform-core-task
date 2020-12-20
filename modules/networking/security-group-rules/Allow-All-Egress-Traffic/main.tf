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

# OUTBOUND
resource "aws_security_group_rule" "allow_all_egrees_traffic" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "All egress traffic"
  security_group_id = var.security_group_id
}