##################################################################################
# AURORA DB SECURITY GROUP
##################################################################################

resource "aws_security_group" "aurora_db" {
    name        = join("-", var.environment, "Aurora-DB"])
    description = "Access from HTTP & HTTPS to Aurora DB cluster instances"
    vpc_id      = vpc_id

    tags = {
        Name = join("-", [var.environment, "Aurora-DB"])
    }
}

# INBOUND RULES
    module "inbound_rule_https_applied_to_aurora_db" {
        source  		    = "/modules/networking/security-group-rules/HTTPS-Inbound"
        security_group_id   = aws_security_group.aurora_db.id
    }

    module "inbound_rule_http_applied_to_aurora_db" {
        source  		    = "./modules/networking/security-group-rules/HTTP-Inbound"
        security_group_id   = aws_security_group.aurora_db.id
    }

# OUTBOUND RULES
    module "outbound_rule_all_applied_to_aurora_db" {
        source  		    = "./modules/networking/security-group-rules/Allow-All-Egress-Traffic"
        security_group_id   = aws_security_group.aurora_db.id
    }