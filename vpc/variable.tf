variable "vpc-cidr" {
  
}

variable "vpc-name" {
  
}
variable "subnet-names" {
  type = list
}
variable "subnet-cidr" {
  type = list
}
variable "route-cidr" {
  
}
variable "route-names" {
    type = list
  
}
variable "elastic-names" {
  type = list
}
variable "nat-names" {
  type = list
}
variable "availability_zone" {
  type = list
}