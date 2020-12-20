##################################################################################
# MEMCACHED CLUSTER
##################################################################################

resource "aws_elasticache_cluster" "memcached" {
  cluster_id           = "memcached-cluster"
  engine               = "memcached"
  node_type            = "cache.t3.medium"
  num_cache_nodes      = 3
  parameter_group_name = "default.memcached1.4"
  port                 = 11211
  security_group_ids   = []

  preferred_availability_zones = []

  tags = {
    Name = join("-", ["memcached", var.environment])
  }
}
