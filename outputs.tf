output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "ubuntu_public_ip" {
  description = "The public IP address of the Ubuntu instance"
  value       = aws_instance.ubuntu_server.public_ip
}

output "ubuntu_public_dns" {
  description = "The public DNS name of the Ubuntu instance"
  value       = aws_instance.ubuntu_server.public_dns
}