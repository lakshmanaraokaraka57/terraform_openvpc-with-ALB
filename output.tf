output "security_group" {
   // value = aws_security_group.sg.id
   value=local.security_group_name
  
}
output "vpc_id" {
  value=local.vpc_id
}
output "alb_dns_name" {
  value=aws_lb.lasya_alb.dns_name
}
output "subnet_id" {
  value=[aws_subnet.public1.id, aws_subnet.public2.id]
  
}