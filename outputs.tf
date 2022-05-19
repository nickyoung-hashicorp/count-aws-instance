# SSH to Vault instance
output "public-ips" {
  value = aws_instance.server.*.public_ip
}

output "public-ips" {
  value = aws_instance.server.*.tags_all
}