# SSH to Vault instance
output "public-ips-and-tags" {
  value = "${aws_instance.server.*.public_ip} \n ${aws_instance.server.*.tags_all}"
}
