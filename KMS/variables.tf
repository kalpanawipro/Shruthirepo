variable "description" {
  type        = string
  description = "The description of the key as viewed in AWS console."
  default = "key for RDS"
}

variable "key_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1"
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the key is enabled."
}

variable "rotation_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "key_for_RDS."
}

variable "alias" {
  type        = string
  description = "The display name of the key."
  default = "keyforRDS"
}



variable "deletion_window_in_days" {
  type        = number
  description = "(optional) The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30."
  default     = 30
}