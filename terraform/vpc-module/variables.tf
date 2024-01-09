variable "cidr" {
}

variable "secondary_cidr_blocks" {
}

variable "name" {
}

variable "azs" {
}

variable "public_subnets" {
}

variable "private_subnets" {
}

variable "enable_nat_gateway" {
  default = true
}

variable "single_nat_gateway" {
  default = true
}
