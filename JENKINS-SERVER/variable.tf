variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "instance_type" {
  type = string
}