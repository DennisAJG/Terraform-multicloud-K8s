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
    name                     = string
    cidr_block               = string
    internet_gateway         = string
    public_route_table_name  = string
    nat_gateway_name         = string
    private_route_table_name = string
    public_subnets = list(object({
      cidr_block        = string
      availability_zone = string
      name              = string
    }))
    private_subnets = list(object({
      cidr_block        = string
      availability_zone = string
      name              = string
    }))
  })

  default = {
    name                     = "vpc_foodzip_k8s"
    cidr_block               = "10.0.0.0/24"
    internet_gateway         = "vcp-foodzip-k8s-igw"
    nat_gateway_name         = "foodzip-k8s-nat-gateway"
    private_route_table_name = "foodzip-k8s-route-table-private"
    public_route_table_name  = "foodzip-k8s-route-table-public"
    public_subnets = [{
      name       = "foodzip-k8s-subnet-public-us-east-1a"
      cidr_block = "10.0.0.0/26"
      availability_zone = "us-east-1a"
      },
      {
        name       = "foodzip-k8s-subnet-public-us-east-1b"
        cidr_block = "10.0.0.64/26"
        availability_zone = "us-east-1b"
      }
    ]
    private_subnets = [{
      name       = "foodzip-k8s-subnet-private-us-east-1a"
      cidr_block = "10.0.0.128/26"
      availability_zone = "us-east-1a"
      },
      {
        name       = "foodzip-k8s-subnet-private-us-east-1b"
        cidr_block = "10.0.0.192/26"
        availability_zone = "us-east-1b"  
    }]
  }
}