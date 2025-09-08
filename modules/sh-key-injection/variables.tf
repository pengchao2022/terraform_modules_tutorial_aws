variable "key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
  default     = "my-ssh-key"
}

variable "public_key_path" {
  description = "Path to your local SSH public key file (usually ~/.ssh/id_rsa.pub)"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_username" {
  description = "Username to add the SSH key for (ec2-user for Amazon Linux, ubuntu for Ubuntu, etc.)"
  type        = string
  default     = "ubuntu"
}

variable "tags" {
  description = "Additional tags for the key pair"
  type        = map(string)
  default     = {}
}