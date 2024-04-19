resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = ["subnet-0d5bcbda261686e8e", "subnet-0d6c0d3b4fa0db74e", "subnet-047b3e8560147aa72"]

  tags = {
    Name = "My DB Subnet Group"
  }
}

resource "aws_db_instance" "mydbpost" {
  allocated_storage    = 10
  db_name              = "mydbpostgres"
  engine               = "postgres"
  engine_version       = "15.4"
  instance_class       = "db.m5d.large"
  username             = "test"
  password             = "test12345"
  storage_type         =  "gp2"
  identifier           = "mydbpost"
  kms_key_id           =  "arn:aws:kms:us-west-2:905418134615:key/mrk-6ac15e8d20b6480d86d599411bf85f1f"
  multi_az             =  true
  publicly_accessible  =  "false"
  storage_encrypted =  "true"
  


backup_retention_period = 7 
backup_window = "03:00-04:00"
maintenance_window = "mon:04:30-mon:05:00"
monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn
monitoring_interval = 60 # Interval in seconds (minimum 60 seconds)

performance_insights_enabled = true

 
  skip_final_snapshot  = true
  deletion_protection = false


vpc_security_group_ids = [aws_security_group.rds_post_sg.id]
db_subnet_group_name   = "${aws_db_subnet_group.my_db_subnet_group.name}"
}


resource "aws_security_group" "rds_post_sg" {
  //name_prefix = "rds-"
  name = "rds_post_sg"

  vpc_id = "vpc-04525a6f03a8e5ba3"

  # Add any additional ingress/egress rules as needed
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.162/32"]
    
  }

  tags = {
    Name = "rds_post_sg"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

    
  }
}

resource "aws_iam_role" "rds_monitoring_role" {
  name = "rds-monitoring-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "rds_monitoring_attachment" {
  name       = "rds-monitoring-attachment"
  roles      = [aws_iam_role.rds_monitoring_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

/*resource "aws_kms_key" "key_for_posgres" {

  
  description             = key_for_posgres
  deletion_window_in_days = 10
  key_usage = "ENCRYPT_DECRYPT"
  //policy = aws_kms_key_policy.KMSpolicy.arn
  
  tags = {
    Name = "third key"
  }
}
*/


resource "aws_db_instance" "replica" {
  replicate_source_db = aws_db_instance.mydbpost.identifier
  instance_class = "db.m5d.large"
  identifier = "replica"
 

  vpc_security_group_ids = [aws_security_group.rds_post_sg.id]
  //db_subnet_group_name   = "${aws_db_subnet_group.my_db_subnet_group.name}"

  backup_retention_period = 7
  backup_window = "03:00-04:00"
  maintenance_window = "mon:04:30-mon:05:00"
  skip_final_snapshot = true
  //final_snapshot_identifier = "my-db"
  monitoring_interval = 60
  monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn
  performance_insights_enabled = true
  storage_encrypted = true
  kms_key_id = "arn:aws:kms:us-west-2:905418134615:key/mrk-6ac15e8d20b6480d86d599411bf85f1f"
 



  # Enable Multi-AZ deployment for high availability
  multi_az = true
}

resource "aws_db_instance" "standby" {
  replicate_source_db = aws_db_instance.mydbpost.identifier
  instance_class = "db.m5d.large"
  identifier = "standby"

  vpc_security_group_ids = [aws_security_group.rds_post_sg.id]
  //db_subnet_group_name   = "${aws_db_subnet_group.my_db_subnet_group.name}"

  backup_retention_period = 7
  backup_window = "03:00-04:00"
  maintenance_window = "mon:04:30-mon:05:00"
  skip_final_snapshot = true
   //final_snapshot_identifier = "my-db"
  monitoring_interval = 60
  monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn
  performance_insights_enabled = true
  storage_encrypted = true
  kms_key_id = "arn:aws:kms:us-west-2:905418134615:key/mrk-6ac15e8d20b6480d86d599411bf85f1f"

  



  # Enable Multi-AZ deployment for high availability
  multi_az = true
}



