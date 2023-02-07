output "public-ip" {
    value = aws_instance.myinstance.public_ip
  
}
output "private-ip" {
  value = aws_instance.myinstance.public_ip
}
output "myid" {
  value = aws_instance.myinstance.id
}