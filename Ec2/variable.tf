variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0b8e0a5c1b1480823"
}

variable "ami2" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0b8e0a5c1b1480823"
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}


variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "Terraform_key3"
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "private_subnet_1"
  type        = string
  default     = "subnet-0df00167d663076f6"
}

variable "subnet_id2" {
  description = "public_subnet_2"
  type        = string
  default     = "subnet-0068764f534de2dd1"
}


variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = true
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(any)
  default     = [10]
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(any)
  default     = [20]
}

variable "name" {
  description = "Name of security group - not required if create_sg is false"
  type        = string
  default     = null
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = "vpc-04525a6f03a8e5ba3"
}

variable "kms_key_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = "arn:aws:kms:us-west-2:905418134615:key/301e52c9-83c8-48f4-b73c-0fdadfb6926e"
}
