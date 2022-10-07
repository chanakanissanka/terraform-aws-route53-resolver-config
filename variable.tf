variable "security_group_id" {}

variable "vpc_id" {
  description = "VPC ID"
}

variable "rules" {
  default = []
  type = list(object({
    rule_name   = string
    domain_name = string
    ips         = list(string)

  }))

}






