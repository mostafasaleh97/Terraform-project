
output "private-ip" {
  value = aws_instance.privateinstance.private_ip
}
output "myid" {
  value = aws_instance.privateinstance.id
}