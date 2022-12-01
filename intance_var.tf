variable "ami" {
  type = string
  default = "ami-074dc0a6f6c764218"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "tags" {
  type = string
  default = "kk_ec2"
}
