variable "default_tags" {
  type = object({
    Project     = string
    Environment = string
  })
    default = {
        Project     = "foodzip"
        Environment = "development"
    }

}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::282681675072:role/foodzip-role"
    region = "us-east-1"
  }
}

variable "vpc" {
  type = object({
    name       = string
    cidr_block = string
  })

  default = {
    name       = "main_vpc"
    cidr_block = "10.0.0.0/16"
  }
}

