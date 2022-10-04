variable "security_group_id" {}

variable "vpc_id" {}

variable "rules" {
  default = []
  type    = list(any)

}

variable "rule_type" {}
