# MAIN - Infrastructure As Code

This repo defines the infrastructure code for development environent

- Cluster of application server instances
  - AWS LB in front of this cluster
- Cluster of worker server instances
- Aurora database cluster (MySQL Engine, at least 3 instances)
- Memcached cluster (elasticache)
- Redis cluster (elasticache)
- These items should be contained in a basic VPC with the appropriate pieces:
  - security groups ○ subnets
  - gateways (NAT or otherwise)
- other infrastructure components as needed, etc
