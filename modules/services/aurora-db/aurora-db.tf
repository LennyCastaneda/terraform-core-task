##################################################################################
#  AURORA DATABASE
##################################################################################

resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = "aurora-cluster-db"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = join("-", [var.environment, "mysql"])
  master_username         = var.username
  master_password         = var.password
  backup_retention_period = 5
  preferred_backup_window = "04:00-05:00"
}

