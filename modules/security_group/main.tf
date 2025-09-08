# Security Group Resource
resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )

  # Lifecycle policy to prevent destruction of security group when rules are modified
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [description]
  }
}