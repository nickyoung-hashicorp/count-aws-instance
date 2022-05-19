# SSH to Vault instance
output "public-ips" {
  value = aws_instance.server.*.public_ip
}

output "tags" {
  value = aws_instance.server.*.tags_all
}