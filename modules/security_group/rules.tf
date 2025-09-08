# Simplified and reliable security group rules

# Ingress rules with CIDR blocks
resource "aws_security_group_rule" "ingress_cidr" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule if length(try(rule.cidr_blocks, [])) > 0 }

  description       = try(each.value.description, "Ingress rule")
  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.this.id
}

# Ingress rules with source security groups
resource "aws_security_group_rule" "ingress_sg" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule if length(try(rule.security_groups, [])) > 0 }

  description              = try(each.value.description, "Ingress rule")
  type                     = "ingress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.security_groups[0]
  security_group_id        = aws_security_group.this.id
}

# Ingress rules with self reference
resource "aws_security_group_rule" "ingress_self" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule if try(rule.self, false) }

  description       = try(each.value.description, "Ingress rule")
  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  self              = true
  security_group_id = aws_security_group.this.id
}

# Egress rules with CIDR blocks
resource "aws_security_group_rule" "egress_cidr" {
  for_each = { for idx, rule in var.egress_rules : idx => rule if length(try(rule.cidr_blocks, [])) > 0 }

  description       = try(each.value.description, "Egress rule")
  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.this.id
}

# Egress rules with source security groups
resource "aws_security_group_rule" "egress_sg" {
  for_each = { for idx, rule in var.egress_rules : idx => rule if length(try(rule.security_groups, [])) > 0 }

  description              = try(each.value.description, "Egress rule")
  type                     = "egress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.security_groups[0]
  security_group_id        = aws_security_group.this.id
}

# Egress rules with self reference
resource "aws_security_group_rule" "egress_self" {
  for_each = { for idx, rule in var.egress_rules : idx => rule if try(rule.self, false) }

  description       = try(each.value.description, "Egress rule")
  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  self              = true
  security_group_id = aws_security_group.this.id
}