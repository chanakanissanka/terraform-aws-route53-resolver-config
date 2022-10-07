module "r53-resolver-enpoints-rules" {
  source = "git::https://github.com/chanakanissanka/terraform-aws-route53-resolver-endpoints"
  rules = [
    {
      rule_name   = "r53-rule-1"
      domain_name = "onprem.co.nz."
      ips         = ["10.200.0.4", "10.200.0.5"]

    },
    {
      rule_name   = "r53-rule-2"
      domain_name = "internal.azure.co.nz."
      ips         = ["10.200.0.4", "10.200.0.5"]

  }]
  vpc_id = "vpc-072b83a0cddfae6ba"
  #security_group_id = "sg-0bcf6fabd2f3c2b68"

}
