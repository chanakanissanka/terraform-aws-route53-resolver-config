data "aws_security_group" "selected" {
  id = var.security_group_id
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
