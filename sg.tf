# # resource "aws_security_group" "kk_sg" {
# #   name        = "kk_sg"
# #   description = "Allow TLS inbound traffic"
# #    vpc_id      = aws_vpc.kk_vpc.id

# #   ingress {
# #     description      = "TLS from VPC"
# #     from_port        = 80
# #     to_port          = 80
# #     protocol         = "tcp"
# #     cidr_blocks      = [aws_vpc.kk_vpc.cidr_block]
# #    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
# #   }
# #   ingress {
# #     description      = "TLS from VPC"
# #     from_port        = 22
# #     to_port          = 22
# #     protocol         = "tcp"
# #     cidr_blocks      = [aws_vpc.kk_vpc.cidr_block]
# #    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
# #   }

# #   egress {
# #     from_port        = 0
# #     to_port          = 0
# #     protocol         = "-1"
# #     cidr_blocks      = ["0.0.0.0/0"]
# #     #ipv6_cidr_blocks = ["::/0"]
# #   }

# #   tags = {
# #     Name = "kk_sg"
# #     # instance_name = "helloworld"
# #   }
# # }
# # # resource "aws_network_interface" "nic" {
# # #   subnet_id       = aws_subnet.kk_subnet.id
# # #   private_ips     = ["10.1.0.6"]

# # #   tags = {
# # #     name = "kk_subnet"
# # #   }
# # # }

# # resource "aws_network_interface_sg_attachment" "sg_attachment" {
# #   security_group_id    = aws_security_group.kk_sg.id
# #   network_interface_id = aws_instance.kk_ec2.primary_network_interface_id
# # }

locals {
  ports_in = [
    443,
    80,
    22,
    8080
  ]
  ports_out = [
    0
  ]
}

resource "aws_security_group" "kk_sg" {
  name        = "kk_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.kk_vpc.id

 dynamic "ingress" {
    for_each = toset(local.ports_in)
    #description      = "TLS from VPC"
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
 }
dynamic  "egress" {  
    for_each = toset(local.ports_out)
    content {
    from_port        = egress.value
    to_port          = egress.value
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }
}
  tags = {
    Name = "kk_sg"
  }
}






