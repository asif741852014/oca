output "vpc_id" {
    value = aws_vpc.vpc16.id
}




output "s1" {
  value = aws_subnet.subnet1.id
}

output "s2" {
  value = aws_subnet.subnet2.id
}