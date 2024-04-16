output "EBS_key_arn" {
  value = aws_kms_key.key_for_EBS.arn
}
 
output "S3_key_arn" {
  value = aws_kms_key.key_for_S3.arn
}
 
output "RDS_key_arn" {
  value = aws_kms_key.key_for_RDS.arn
}
 
output "EKS_key_arn" {
  value = aws_kms_key.key_for_EKS.arn
}
