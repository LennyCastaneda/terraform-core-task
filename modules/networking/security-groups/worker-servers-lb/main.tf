##################################################################################
# LOAD BALANCER SECURITY GROUP
##################################################################################

resource "aws_security_group" "cluster_worker_server_lb" {
    name        = "NonProd-Cluster-Worker-Server-LB"
    description = "For cluster worker server load balancer"
    vpc_id      = var.vpc_id
    
    tags = {
        Name = join("-", [var.environment, "Worker-Servers-LB])
    }
}

# OUTBOUND RULES
  module "outbound_rule_allow_all_applied_to_cluster_worker_server_lb" {
      source  		    = "./modules/networking/security-group-rules/Allow-All-Egress-Traffic"
      security_group_id   = aws_security_group.cluster_worker_server_lb.id
  }