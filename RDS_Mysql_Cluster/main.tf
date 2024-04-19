resource "aws_db_subnet_group" "mydata" {
  name       = "mydata"
  subnet_ids = var.subnets

  tags = {
    Name = "mydata"
  }
}

resource "aws_rds_cluster" "MySQL" {
  cluster_identifier      = "mysql-cluster-demo"
  engine                  = "mysql"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "test"
  master_password         = "test12345"
  backup_retention_period = 5
  preferred_backup_window = "03:00-04:00"
  db_subnet_group_name = aws_db_subnet_group.mydata.name
  skip_final_snapshot = true
  allocated_storage = 30
  db_cluster_instance_class = "db.m5d.large"
  storage_type = "gp2"
  kms_key_id = var.kms_key_id
  //enabled_cloudwatch_logs_exports = [ "audit" ]
  storage_encrypted = true

  
  

  tags = {
    Name = "Mysql_cluster"
    env = "Dev"
  }
  
}



