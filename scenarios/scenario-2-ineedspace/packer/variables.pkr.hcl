# variables for Packer file, adapt to your AWS region, base image, vpc, subnet

variable "region" {
  type    = string
  default = "ap-southeast-2"
}

# tested with source Debian 11 image HVM 64-bit (x86)
# change to one in your region
variable "source_ami" {
  type    = string
  default = "ami-0310483fb2b488153"
}

# change to your vpc
variable "vpc_id" {
  type    = string
  default = "vpc-848c82e1"
}

# change to your subnet
variable "subnet_id" {
  type    = string
  default = "subnet-8c4b9ee8"
}

ignore