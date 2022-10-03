variable "security_group_id" {
  default = "sg-0bcf6fabd2f3c2b68"
}
variable "vpc_id" {
  default = "vpc-072b83a0cddfae6ba"

}

variable "rules" {
  default = [
    {
      rule_name   = "r53-rule-1"
      domain_name = "bar.foo."
      ips         = ["192.168.10.10", "192.168.10.11"]

    },
    {
      rule_name   = "r53-rule-2"
      domain_name = "example.com."
      ips         = ["192.168.10.10", "192.168.10.11"]

    }
  ]
  type = list(any)

}
