# SSH to Vault instance
output "tags-and-ips" {
  value = [aws_instance.server.*.tags_all, aws_instance.server.*.public_ip]
}
