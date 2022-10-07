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
  vpc_id    = "enter here - vpc-id"
  rule_type = "FORWARD"


}
