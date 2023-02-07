output "subnet-id1" {
  value = aws_subnet.subnet[0].id
}
output "subnet-id2" {
  value = aws_subnet.subnet[1].id
}
output "subnet-id3" {
  value = aws_subnet.subnet[2].id
}
output "subnet-id4" {
  value = aws_subnet.subnet[3].id
}
output "vpc-id" {
    value = aws_vpc.myvpc.id
  
}
output "dependent" {
    value = aws_vpc.myvpc
  
}