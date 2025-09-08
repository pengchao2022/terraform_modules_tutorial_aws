output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.this.id
}

output "security_group_arn" {
  description = "ARN of the created security group"
  value       = aws_security_group.this.arn
}

output "security_group_name" {
  description = "Name of the created security group"
  value       = aws_security_group.this.name
}

output "security_group_description" {
  description = "Description of the created security group"
  value       = aws_security_group.this.description
}

output "vpc_id" {
  description = "VPC ID where the security group is created"
  value       = aws_security_group.this.vpc_id
}

output "security_group_owner_id" {
  description = "Owner ID of the security group"
  value       = aws_security_group.this.owner_id
}