variable "key_for_RDS" {
  description = "key for RDS"
  type        = string
  default     = "arn:aws:kms:us-west-2:905418134615:key/mrk-6ac15e8d20b6480d86d599411bf85f1f"
}


variable "kms_key_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = "arn:aws:kms:us-west-2:905418134615:key/mrk-6ac15e8d20b6480d86d599411bf85f1f"
}
