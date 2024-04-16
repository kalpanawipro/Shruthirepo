resource "aws_security_group" "Ec2_SG" {
    name                   = var.name
    description            = var.description
    vpc_id                 = var.vpc_id
    
    ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow SSH"
  }



    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    }

}
