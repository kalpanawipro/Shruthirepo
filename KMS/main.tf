resource "aws_kms_key" "primary" {
  multi_region             = true
  description              = var.description
  customer_master_key_spec = var.key_spec
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.rotation_enabled
  //policy                   = var.primary_key_policy
  deletion_window_in_days  = var.deletion_window_in_days

  tags = merge(
    var.tags,
    {
      "Multi-Region" = "true",
      "Primary"      = "true"
    }
  )
}

# Add an alias to the primary key
resource "aws_kms_alias" "primary" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.primary.key_id
}