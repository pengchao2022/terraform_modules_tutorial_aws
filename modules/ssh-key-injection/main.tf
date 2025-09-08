# Create AWS key pair from your existing public key
resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
  
  tags = merge(
    var.tags,
    {
      Name = var.key_name
    }
  )
}
