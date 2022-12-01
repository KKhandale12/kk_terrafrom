# ### list variable ######
# # variable "cidr_block" {
# #   type    = string
# #   default = "10.1.0.0/16"
# # }

# # variable "public_subnet" {
# #   type    = string
# #   default = "10.1.0.0/18"
# # }


# # variable "kk_sg" {
# #   type    = string
# #   default = "kk_sg"
# # }

# # variable "map_ip" {
# #   type    = bool
# # }

# variable "product" {

# }
# variable "envi" {

# }

# variable "ec2_class" {

# }

# variable "ami" {

# }
# variable "subnet_la" {

# }

# variable "vpc_id" {
#   type = string
#   default = "vpc-0a46eb05de0ab5809"
# }

# variable "port" {
#   type = string
#   default = "80"
# }

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "az" {
	type = list
	default = ["ap-south-1a","ap-south-1b"]
}

variable "rt" {
  type = string
  default = "0.0.0.0/0"
}







