# Terraform Core Task - Infrastructure As Code

## Remote State

For this coding task is intended for demonstration purposes only and it is assumed to use local remote state. In an actualy AWS environment, the remote state backend would be stored in an S3 bucket/DynamoDB table or in Terraform Cloud.

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
