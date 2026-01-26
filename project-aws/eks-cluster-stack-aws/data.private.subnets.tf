data "aws_subnets" "private" {
  filter {
    name   = "tag:Project"
    values = ["foodzip"]
  }
  
  filter {
    name = "tag:Environment"
    values = ["development"]
  }

  filter {
    name = "map-public-ip-on-launch"
    values = [ false ]
  }

}