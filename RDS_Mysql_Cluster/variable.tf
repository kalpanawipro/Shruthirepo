variable "kms_key_id" {
  description = "kms_key"
  type        = string
  default     = "arn:aws:kms:us-west-2:905418134615:key/mrk-6ac15e8d20b6480d86d599411bf85f1f"
}

variable "subnets" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
  default     = ["subnet-05a4fb2d978d6b5b9", "subnet-060d75e55d82befa3", "subnet-07a8da2004927af7f"]
}