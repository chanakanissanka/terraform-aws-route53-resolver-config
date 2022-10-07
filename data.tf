data "aws_security_groups" "selected" {
  #id = var.security_groups_id
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
