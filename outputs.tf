# outputs.tf
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "ubuntu_public_ip" {
  description = "Public IP address of the Ubuntu instance"
  value       = aws_instance.ubuntu_server.public_ip
}

output "ubuntu_public_dns" {
  description = "Public DNS name of the Ubuntu instance"
  value       = aws_instance.ubuntu_server.public_dns
}