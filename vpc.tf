 resource "aws_vpc" "kk_vpc" {
 cidr_block       = var.vpc_cidr
#   # instance_tenancy = "dedicated"
  
 tags = {
     Name = "kk_vpc"
   }
 }

# # ######  public subnet #######

 resource "aws_subnet" "kk_publicsubnet" {
  vpc_id = aws_vpc.kk_vpc.id
  cidr_block = var.subnet[0]
  availability_zone = var.az[0]
 }
# # ######  private subnet #######

 resource "aws_subnet" "kk_privatesubnet" {
  vpc_id = aws_vpc.kk_vpc.id
  cidr_block = var.subnet[1]
  availability_zone = var.az[1]
 }

########### IGW #######################

resource "aws_internet_gateway" "kk_igw" {
  vpc_id = aws_vpc.kk_vpc.id

}


############## route table for public subnet #########################

resource "aws_route_table" "rt_pubsubnet" {
  vpc_id = aws_vpc.kk_vpc.id

  route {
    cidr_block = var.rt
    gateway_id = aws_internet_gateway.kk_igw.id
  }
}

############# route table association public subnet #########################

resource "aws_route_table_association" "pub_rt_association" {
  subnet_id      = aws_subnet.kk_publicsubnet.id
  route_table_id = aws_route_table.rt_pubsubnet.id
}



#   availability_zone = "ap-south-1a"
#   map_public_ip_on_launch = var.map_ip
#   tags = {
#     Name = "kk_subnet"
#   }
 

# # ####### network interface ###

# resource "aws_network_interface" "nic" {
#   subnet_id       = aws_subnet.kk_subnet.id
#   private_ips     = ["10.1.0.6"]

#   tags = {
#     name = "kk_subnet"
#   }
# }


