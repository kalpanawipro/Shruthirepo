resource "aws_kms_key" "key_for_EBS" {

 
  description             = "key_for_EBS"
  deletion_window_in_days = 10
  key_usage = "ENCRYPT_DECRYPT"
  //policy = aws_kms_key_policy.KMSpolicy.arn
  
  tags = {
    Name = "key_for_EBS"
  }
}

resource "aws_kms_alias" "key_for_EBS"{
    name = "alias/key_for_EBS"
    target_key_id = aws_kms_key.key_for_EBS.id
}

resource "aws_kms_key" "key_for_S3" {

 
  description             = "key_for_S3"
  deletion_window_in_days = 10
  key_usage = "ENCRYPT_DECRYPT"
  //policy = aws_kms_key_policy.KMSpolicy.arn
  
  tags = {
    Name = "key_for_S3"
  }
}

resource "aws_kms_alias" "key_for_S3"{
    name = "alias/key_for_S3"
    target_key_id = aws_kms_key.key_for_S3.id
}


resource "aws_kms_key" "key_for_RDS" {

 
  description             = "key_for_RDS"
  deletion_window_in_days = 10
  key_usage = "ENCRYPT_DECRYPT"
  //policy = aws_kms_key_policy.KMSpolicy.arn
  
  tags = {
    Name = "key_for_RDS"
  }
}

resource "aws_kms_alias" "key_for_RDS"{
    name = "alias/key_for_RDS"
    target_key_id = aws_kms_key.key_for_RDS.id
}

resource "aws_kms_key" "key_for_EKS" {

 
  description             = "key_for_EKS"
  deletion_window_in_days = 10
  key_usage = "ENCRYPT_DECRYPT"
  //policy = aws_kms_key_policy.KMSpolicy.arn
  
  tags = {
    Name = "key_for_EKS"
  }
}

resource "aws_kms_alias" "key_for_EKS"{
    name = "alias/key_for_EKS"
    target_key_id = aws_kms_key.key_for_EKS.id
}