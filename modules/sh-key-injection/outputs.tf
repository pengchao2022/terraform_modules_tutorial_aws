output "key_name" {
  description = "Name of the SSH key pair in AWS"
  value       = aws_key_pair.this.key_name
}

output "key_pair_id" {
  description = "ID of the AWS key pair"
  value       = aws_key_pair.this.key_pair_id
}

