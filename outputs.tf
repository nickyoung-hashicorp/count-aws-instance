# SSH to Vault instance
output "aws-instances" {
  value = aws_instance.server.tags_all
}
