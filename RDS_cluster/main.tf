resource "aws_db_subnet_group" "database" {
  name       = "database"
  subnet_ids = var.subnets

  tags = {
    Name = "database"
  }
}

resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = "postgres-cluster-demo"
  engine                  = "postgres"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "test"
  master_password         = "test12345"
  backup_retention_period = 5
  preferred_backup_window = "04:00-05:00"
  db_subnet_group_name = aws_db_subnet_group.database.name
  skip_final_snapshot = true
  allocated_storage = 30
  db_cluster_instance_class = "db.m5d.large"
  storage_type = "gp3"
  iops = 3000
  kms_key_id = var.kms_key_id
  //enabled_cloudwatch_logs_exports = [ "audit" ]
  storage_encrypted = true
  


  tags = {
    Name = "postgres_cluster"
    env = "Dev"
  }
  
}







