resource "aws_launch_template" "lasya_tmt" {
    image_id="ami-08abeca95324c9c91"
    instance_type = "t2.micro"
    name="lasya-LT"
    network_interfaces {
      associate_public_ip_address = true
      security_groups = [aws_security_group.sg_ec2.id]
    }
  user_data = filebase64("userdata.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name="${local.resource_name}-LT"
    }
  }
}