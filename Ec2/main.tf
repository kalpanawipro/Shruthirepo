/*resource "aws_instance" "demo_server1" {
  
  ami                  = var.ami
  instance_type        = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  //vpc_security_group_ids = var.vpc_security_group_ids
  key_name             = var.key_name
  monitoring           = var.monitoring

  //iam_instance_profile = var.create_iam_instance_profile ? aws_iam_instance_profile.this[0].name : var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [aws_security_group.Ec2_SG.id]
  
  root_block_device {
    volume_size           = 30
    volume_type           = "gp2"
    delete_on_termination = true

    tags = {
      Name = "server1_root"
    }
  }
  tags = {
    Name = "server1"
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = aws_instance.demo_server1.availability_zone
  size              = 20
  type              = "gp2"
  encrypted = true
  kms_key_id = "${var.kms_key_id}"
  tags = {
    Name = "volume_1"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.demo_server1.id
}
*/

 #creating second server

resource "aws_instance" "demo_server2" {
  
  ami                  = var.ami2
  instance_type        = var.instance_type
  

  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id2
  //vpc_security_group_ids = var.vpc_security_group_ids

  key_name             = var.key_name
  monitoring           = var.monitoring
  //iam_instance_profile = var.create_iam_instance_profile ? aws_iam_instance_profile.this[0].name : var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [aws_security_group.Ec2_SG.id]
  

   root_block_device {
    volume_size           = 30
    volume_type           = "gp2"
    delete_on_termination = true

    tags = {
      Name = "server2_root"
    }
  }
  tags = {
    Name = "server2"
  }
}

resource "aws_ebs_volume" "ebs-volume-2" {
  availability_zone = aws_instance.demo_server2.availability_zone
  size              = 20
  type              = "gp2"
  encrypted = true
  kms_key_id = "${var.kms_key_id}"
  tags = {
    Name = "volume_1"
  }
}

resource "aws_volume_attachment" "ebs-volume-2-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-2.id
  instance_id = aws_instance.demo_server2.id
}


 