resource "aws_db_instance" "mydb" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t3.micro"
  username             = "Test"
  password             = "Test12345"
  storage_type         =  "gp2"
  identifier           = "mydb"
  kms_key_id = "${var.kms_key_id}"
  storage_encrypted = true
  
  
  
 
  skip_final_snapshot  = true
  deletion_protection = false

 vpc_security_group_ids = [aws_security_group.rds_sg.id]
db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name

  
}



/*resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "My DB Subnet Group"
  }
}
*/

resource "aws_security_group" "rds_sg" {
  //name_prefix = "rds-"
  name = "rds_sg"

  vpc_id = "vpc-04525a6f03a8e5ba3"

  # Add any additional ingress/egress rules as needed
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.162/32"]
    
  }

  tags = {
    Name = "rds_sg"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

    
  }
}




