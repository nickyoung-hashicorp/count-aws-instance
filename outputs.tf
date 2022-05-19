# SSH to Vault instance
output "aws-instances" {
  value = [${aws_instance.server[count.index].public_ip}]
}
