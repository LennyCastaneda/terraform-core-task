##################################################################################
# WORKER SERVER SECURITY GROUP
##################################################################################

resource "aws_security_group" "cluster_worker_servers" {
    name        = "NonProd-Cluster-Worker-Servers"
    description = "For cluster server instances"
    vpc_id      = var.nonprod_vpc_id
    
    tags = {
        Name = join("-", [var.environment, "Worker-Servers])
    }
}

# OUTBOUND RULES
module "outbound_rule_allow_all_applied_to_cluster_worker_servers" {
    source  		    = "./modules/networking/security-group-rules/Allow-All-Egress-Traffic"
    security_group_id   = aws_security_group.cluster_worker_servers.id
}

