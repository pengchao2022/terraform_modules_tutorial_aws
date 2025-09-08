variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the security group"
  type        = map(string)
  default     = {}
}

# Ingress Rules Variables
variable "ingress_rules" {
  description = "List of ingress rules to create"
  type = list(object({
    description     = optional(string, "Ingress rule")
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string), [])
    security_groups = optional(list(string), [])
    self            = optional(bool, false)
  }))
  default = []
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules with CIDR blocks (simplified format)"
  type = list(object({
    description = optional(string, "Ingress rule")
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "ingress_with_source_sg" {
  description = "List of ingress rules with source security groups"
  type = list(object({
    description     = optional(string, "Ingress rule")
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  }))
  default = []
}

# Egress Rules Variables
variable "egress_rules" {
  description = "List of egress rules to create"
  type = list(object({
    description     = optional(string, "Egress rule")
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string), [])
    security_groups = optional(list(string), [])
    self            = optional(bool, false)
  }))
  default = []
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules with CIDR blocks (simplified format)"
  type = list(object({
    description = optional(string, "Egress rule")
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_with_destination_sg" {
  description = "List of egress rules with destination security groups"
  type = list(object({
    description     = optional(string, "Egress rule")
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  }))
  default = []
}

# Common Protocols Predefined Rules
variable "allow_all_egress" {
  description = "Whether to allow all outbound traffic"
  type        = bool
  default     = true
}

variable "allow_ssh" {
  description = "Whether to allow SSH access (port 22)"
  type        = bool
  default     = false
}

variable "ssh_allowed_cidr_blocks" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_http" {
  description = "Whether to allow HTTP access (port 80)"
  type        = bool
  default     = false
}

variable "allow_https" {
  description = "Whether to allow HTTPS access (port 443)"
  type        = bool
  default     = false
}

variable "allow_redis" {
  description = "Whether to allow Redis access (port 6379)"
  type        = bool
  default     = false
}

variable "allow_postgresql" {
  description = "Whether to allow PostgreSQL access (port 5432)"
  type        = bool
  default     = false
}

variable "allow_mysql" {
  description = "Whether to allow MySQL access (port 3306)"
  type        = bool
  default     = false
}

variable "allow_icmp" {
  description = "Whether to allow ICMP traffic"
  type        = bool
  default     = false
}