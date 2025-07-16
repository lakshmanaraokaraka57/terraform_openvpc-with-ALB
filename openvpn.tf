resource "aws_security_group" "openvpn" {
    name="${local.resource_name}-openvpn"
    description = "Lasya Infotech Company Security Group Rule for open-vpn"
    vpc_id = aws_vpc.main.id
    tags=merge(
        var.common_tags,
        {
            Name=local.resource_name
        }
    )
    ingress {
      from_port=22
      to_port=22
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
  ingress {
      from_port=443
      to_port=443
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
    ingress {
      from_port=943
      to_port=943
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
  
  ingress {
      from_port=1194
      to_port=1194
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
  
}